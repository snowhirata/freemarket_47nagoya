class Credit < ApplicationRecord
  belongs_to :user
  validates :card_number, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :security_code, presence: true
end
