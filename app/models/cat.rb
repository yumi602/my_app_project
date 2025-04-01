class Cat < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :age, allow_blank: true, numericality: { only_integer: true }

  belongs_to :user
end
