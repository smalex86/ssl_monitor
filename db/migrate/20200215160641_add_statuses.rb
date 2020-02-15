class AddStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table(
      :statuses,
      comment: 'Таблица статусов проверки'
    ) do |t|
      t.integer :code, comment: 'Код статуса'
      t.string :name, comment: 'Название статуса'
      t.string :description, comment: 'Описание статуса'
      t.timestamps
    end
  end
end
