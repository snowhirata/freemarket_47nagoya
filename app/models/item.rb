class Item < ApplicationRecord
  belongs_to :buyer, class_name: 'User', optional: true
  # itemとuserのアソシエーション　user設定完了時追加
  belongs_to :user
  has_many :pictures, dependent: :destroy
  belongs_to :category
  belongs_to :child_category, class_name: 'Category'
  belongs_to :grand_child_category, class_name: 'Category'
  accepts_nested_attributes_for :pictures
  has_many :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :state
    validates :prefecture_id
    validates :ship_charge
    validates :ship_method
    validates :ship_date
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :category_id
    validates :user_id
    validates_associated :pictures, length: {in: 1..10}
  end
end
