class Picture < ApplicationRecord
  belongs_to :item
  mount_uploader :image, PictureUploader
end
