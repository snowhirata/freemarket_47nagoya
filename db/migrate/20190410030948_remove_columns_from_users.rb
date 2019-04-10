class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :postal_code, :integer
    remove_column :users, :prefecture_id, :integer
    remove_column :users, :city, :string
    remove_column :users, :block, :string
    remove_column :users, :building, :string
    remove_column :users, :phone_number, :string
    remove_column :users, :profile_detail, :text
    remove_column :users, :card_number, :integer
    remove_column :users, :security_code, :integer
    remove_column :users, :exp_month, :string
    remove_column :users, :exp_year, :string
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
  end
end
