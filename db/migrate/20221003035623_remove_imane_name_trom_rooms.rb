class RemoveImaneNameTromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :image_name, :string
  end
end
