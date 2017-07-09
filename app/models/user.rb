class User < ApplicationRecord
  before_save {email.downcase!}

  validates :content, length: {maximum: Settings.content.maximum}
  validates :password, presence: true, length: {minimum: Settings.password.minimum},
    allow_nil: true
  validates :full_name, presence: true, length: {maximum: Settings.user.maximum}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_many :comments, dependent: :destroy
  has_many :tags
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
