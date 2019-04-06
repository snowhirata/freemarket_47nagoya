class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer :security_code
      t.string :exp_month
      t.string :exp_year
      t.integer :card_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
