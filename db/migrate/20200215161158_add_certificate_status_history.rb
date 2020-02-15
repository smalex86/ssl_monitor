class AddCertificateStatusHistory < ActiveRecord::Migration[6.0]
  def change
    create_table(
      :certificate_status_history,
      comment: 'Таблица истории проверки сертификатов'
    ) do |t|
      t.integer :certificate_id, comment: 'Идентификатор сертификата'
      t.integer :status_code, comment: 'Код статуса проверки'
      t.timestamps
    end
  end
end
