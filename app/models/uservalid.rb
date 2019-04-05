class Uservalid < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum:12 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum:12 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
end
