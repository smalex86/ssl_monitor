Rails.application.routes.draw do

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  mount SslMonitor::Base => '/'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == '12345678'
  end
  mount Sidekiq::Web => '/sidekiq'
end
