class User < ApplicationRecord
  # destroy all child elements of user(posts)
  has_many :posts, dependent: :destroy
  #Convert email to lowercase before DB save
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  # correct email format validation with regular expressions
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensetive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  def feed
    Post.where("user_id = ?", id)
  end
end
