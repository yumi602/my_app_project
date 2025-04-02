class Cat < ApplicationRecord
  mount_uploader :cat_image, CatImageUploader

  validates :name, presence: true, length: { maximum: 255 }
  validates :age, allow_blank: true, numericality: { only_integer: true }

  belongs_to :user
  has_many :foods, dependent: :destroy
end
