module SslMonitor
  module Entities
    class Certificate < Grape::Entity
      expose :domain, documentation: { type: 'string', desc: 'Домен для проверки' }
      expose :formatted_status, as: :status
      expose :error
      expose :updated_at

      private

      def formatted_status
        object.status.to_i.zero? ? 'ok' : 'bad'
      end
    end
  end
end
