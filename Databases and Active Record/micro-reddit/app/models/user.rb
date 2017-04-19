class User < ApplicationRecord
  has_many :posts
  has_many :comments
  validates :name, presence: :true, uniqueness: :true, length: { maximum: 24 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }
end
