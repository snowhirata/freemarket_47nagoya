class AddColumnToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits,:brand,:string
  end
end
