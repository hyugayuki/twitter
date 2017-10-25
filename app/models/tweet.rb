class Tweet < ApplicationRecord

  belongs_to :user

  validates :user_id, null: false

end
