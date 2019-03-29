class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items_of_seller, class_name: 'item', foreign_key: 'seller_id'
  has_many :items_of_buyer, class_name: 'item', foreign_key: 'buyer_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
