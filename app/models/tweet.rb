class Tweet < ApplicationRecord

  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images

  validates :user_id, null: false
end
