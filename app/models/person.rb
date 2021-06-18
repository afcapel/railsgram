class Person < ApplicationRecord

  has_secure_password

  has_many :posts

  has_one_attached :avatar

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, format: {
     with: /\A[a-zA-Z0-9]+\z/, message: "only allows letters and numbers" }
end
