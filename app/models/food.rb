class Food < ApplicationRecord
  mount_uploader :food_image, FoodImageUploader

  validates :food, presence: true, length: { maximum: 255 }
  validates :body, allow_blank: true, length: { maximum: 65_535 }

  belongs_to :cat
end
