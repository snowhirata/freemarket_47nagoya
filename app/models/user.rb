class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  enum exp_month:{"01":1, "02":2, "03":3, "04":4, "05":5,"06":6, "07":7, "08":8, "09":9, "10":10, "11":11, "12":12}
  enum exp_year:{"19":19, "20":20, "21":21, "22":22, "23":23,}

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum:6}, length: {maximum:128}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_year, presence: true

end
