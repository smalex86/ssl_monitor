class CreateCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table(
      :certificates,
      comment: 'Таблица сертификатов'
    ) do |t|
      t.string :domain, comment: 'Домен, для которого выполняется проверка серта'
      t.integer :status, comment: 'Код статуса проверки сертификата'
      t.string :error, comment: 'Текст ошибки'
      t.datetime :checked_at, comment: 'Дата последней проверки'
      t.timestamps
    end
  end
end
