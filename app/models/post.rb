class Post < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

=======
>>>>>>> 4bfb311... Finished modal
  has_many :post, through: :tags
  has_many :tags
end
