class Item < ApplicationRecord
  # belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
  # itemとuserのアソシエーション　user設定完了時追加
  belongs_to :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  has_many :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :state, presence: true
  validates :prefecture_id, presence: true
  validates :ship_charge, presence: true
  validates :ship_method, presence: true
  validates :ship_date, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
end
