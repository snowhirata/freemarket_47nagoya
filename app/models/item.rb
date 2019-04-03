class Item < ApplicationRecord
  # belongs_to :seller, class_name: 'User'
  # belongs_to :buyer, class_name: 'User'
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :pictures
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :category_items
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
