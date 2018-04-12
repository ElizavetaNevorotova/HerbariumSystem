class CreateBotanists < ActiveRecord::Migration[5.2]
  def change
    create_table :botanists do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :position

      t.timestamps
    end
  end
end
