class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items_of_seller, class_name: 'item', foreign_key: 'seller_id'
  has_many :items_of_buyer, class_name: 'item', foreign_key: 'buyer_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  enum exp_month:{"01":1, "02":2, "03":3, "04":4, "05":5,"06":6, "07":7, "08":8, "09":9, "10":10, "11":11, "12":12}
  enum exp_year:{"19":19, "20":20, "21":21, "22":22, "23":23,}
end
