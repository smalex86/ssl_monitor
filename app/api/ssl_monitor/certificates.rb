module SslMonitor
  class Certificates < Grape::API
    format :json

    resource :domain do
      desc 'Добавление нового домена'
      params do
        requires :domain, type: String
      end
      post do
        Certificate.create!(domain: params[:domain])
        { status: 'ok' }
      rescue StandardError => e
        { status: 'bad', error: e.message }
      end
    end

    resource :status do
      desc 'Список доменов с их статусами проверки сертификатов'
      get do
        Certificate.status
      end
    end
  end
end