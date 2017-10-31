class User < ApplicationRecord


  has_many :tweets
  #フォローしているユーザーをfollower_idという外部キーを使って特定しなくてはなりません。また、followerというクラス名は存在しないので、ここでもRailsに正しいクラス名を伝える必要が発生します。⬇️
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed #following配列の元はfollowed idの集合である
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, null: false
  validates :user_identifier, null: false
  mount_uploader :image, ImageUploader
    # ユーザーをフォローする
   def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

   # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがother_userをフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

end
