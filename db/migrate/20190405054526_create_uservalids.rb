class CreateUservalids < ActiveRecord::Migration[5.2]
  def change
    create_table :uservalids do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.timestamps
    end
  end
end
