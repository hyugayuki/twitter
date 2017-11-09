class Image < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :tweet, optional: true

  validates :file, null: false
end
