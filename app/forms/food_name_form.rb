class FoodNameForm
  include ActiveModel::API
  include ActiveModel::Attributes

  attr_accessor :food_image

  attribute :food, :string
  attribute :body, :string

  validates :food, presence: true
  validates :body, allow_blank: true, length: { maximum: 250 }

  def attributes
    { food: food, body: body, food_image: food_image }
  end
end
