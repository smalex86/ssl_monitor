module SslMonitor
  class Base < Grape::API
    mount SslMonitor::Certificates
  end
end
