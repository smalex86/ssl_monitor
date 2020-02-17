module SslMonitor
  class Certificates < Grape::API
    format :json

    desc 'Добавление нового домена' do
      params SslMonitor::Entities::Certificate.documentation
    end
    post '/domain' do
      c = Certificate.create!(domain: params[:domain])
      c.check
      present c, with: SslMonitor::Entities::Certificate
    rescue StandardError => e
      { result: 'bad', error: e.message }
    end

    desc 'Список доменов с их статусами проверки сертификатов'
    get '/status' do
      present Certificate.all, with: SslMonitor::Entities::Certificate
    end
  end
end