class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :main_category, null: true
      t.references :sub_category, null: true
      t.integer :depth
      t.text :intro
      t.timestamps
    end
  end
end
