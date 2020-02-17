class Certificate < ApplicationRecord
  ONE_DAY = 86_400

  require 'net/http'
  require 'openssl'

  # Коррекция домена перед создание записи
  before_create do
    self.domain = URI.parse(domain).host if domain.present?
    self.error = '' if error.nil?
    self.status = 0 if status.nil?
  end

  # Выполнить проверку сертификата домена
  def check
    set_ok
    begin
      check_expired(cert.not_after)
    rescue Errno::ECONNREFUSED => e
      self.error = "Ошибка соединения: #{e.message}"
    rescue OpenSSL::SSL::SSLError => e
      ssl_error(e.message)
    rescue StandardError => e
      self.error = "Ошибка: #{e.message}"
    end
    self.status = 1 if error.present?
    save!
    puts "Status: #{status}, error: #{error}"
  end

  # Получить сертификат
  # @return [OpenSSL::X509::Certificate]
  def cert
    uri = URI::HTTPS.build(host: domain)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
    response.peer_cert
  end

  # Начальные значения
  def set_ok
    self.error = ''
    self.status = 0
    touch
  end

  # Текст ошибки SSL
  # @param [String] error
  # @return [String]
  def ssl_error(msg)
    pos = msg.index('error: ')
    self.error = "Ошибка SSL: #{msg[pos + 7, msg.length - 1]}" unless pos.nil?
  end

  # Проверить когда истекает действие сертификата
  # @param [Time] not_after
  def check_expired(not_after)
    if Time.now + 14 * ONE_DAY > not_after
      self.error = 'Действие сертификата истекает менее чем через 2 недели'
      return
    end
    if Time.now + 7 * ONE_DAY > not_after
      self.error = 'Действие сертификата истекает менее чем через 1 неделю'
    end
  end

  # Проверить все
  def self.check
    Certificate.all.each(&:check)
  end
end
