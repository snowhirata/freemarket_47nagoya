class AddColumnCusIdToCredit < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :cus_id, :string
    change_column :credits, :card_number, :string
  end
end
