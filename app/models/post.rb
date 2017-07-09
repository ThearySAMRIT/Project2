class Post < ApplicationRecord
  belongs_to :user
  default_scope -> {order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.content.maximum}
  validates :title, presence: true, length: {maximum: Settings.title.maximum}
  validate :picture_size

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments

  scope :search, ->search{where "title LIKE ?", "%#{search}%"}

  private

  def picture_size
    if picture.size > 10.megabytes
      errors.add(:picture, "should be less than 10MB")
    end
  end
end
