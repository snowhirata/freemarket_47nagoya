class AddItemRefToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :item, :string
    add_column :pictures, :references, :string
  end
end
