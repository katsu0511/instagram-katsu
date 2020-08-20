class Post < ApplicationRecord
  has_one_attached :photos

  belongs_to :user
end
