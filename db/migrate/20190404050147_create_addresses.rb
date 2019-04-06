class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :block
      t.string :building
      t.integer :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
