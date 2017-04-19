class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { maximum: 55 }
  validates :body, presence: true
  validates :user_id, presence: true
end
