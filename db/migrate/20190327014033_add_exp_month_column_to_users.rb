class AddExpMonthColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :exp_month, :integer
    add_column :users, :exp_year, :integer
  end
end
