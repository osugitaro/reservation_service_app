class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :introduction
      t.integer :price
      t.string :address
      t.string :image
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
