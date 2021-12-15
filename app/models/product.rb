class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\z}i,
    message: 'Must be a GIF, PNG or JPG'
  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
