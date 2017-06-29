class User < ApplicationRecord
  has_many :tags
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable
end
