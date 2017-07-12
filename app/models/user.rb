class User < ApplicationRecord
  before_save {email.downcase!}

  validates :content, length: {maximum: Settings.content.maximum}
  validates :password, presence: true, length: {minimum: Settings.password.minimum},
    allow_nil: true

  validates :full_name, presence: true, length: {maximum: Settings.user.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_many :comments, dependent: :destroy
  has_many :tags
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id",
    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id",
    dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :search, ->search{where "title LIKE ?", "%#{search}%"}

  def feed
    following_ids = "SELECT followed_id FROM relationships
      WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
      OR user_id = :user_id", user_id: id)
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete(other_user)
  end

  def following? other_user
    following.include?(other_user)
  end
end
