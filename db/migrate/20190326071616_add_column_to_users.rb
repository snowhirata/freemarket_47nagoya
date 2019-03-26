class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :block, :string
    add_column :users, :building, :string
    add_column :users, :phone_number, :string
    add_column :users, :profit, :string
  end
end
