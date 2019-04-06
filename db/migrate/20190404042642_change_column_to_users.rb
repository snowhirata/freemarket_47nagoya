class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_year, :integer
    change_column :users, :birth_month, :integer
    change_column :users, :birth_day, :integer
  end
end
