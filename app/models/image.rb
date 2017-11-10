class Image < ApplicationRecord

  mount_uploader :file, FilesUploader

  belongs_to :tweet, optional: true

  validates :file, null: false
end
