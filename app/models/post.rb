class Post < ApplicationRecord

  belongs_to :profile

  has_one_attached :picture
  has_one_attached :original_picture

  validates :original_picture, presence: true

  scope :has_picture, -> { joins(:picture_attachment) }
end
