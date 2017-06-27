class User < ApplicationRecord
  has_many :tages
  has_many :posts, through: :tags
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
