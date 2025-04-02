class CatNameForm
  include ActiveModel::API
  include ActiveModel::Attributes

  attr_accessor :cat_image

  attribute :name, :string
  attribute :age, :integer
  attribute :user_id, :integer

  validates :name, presence: true, length: { maximum: 255 }
  validates :age, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }

  def attributes
    { name: name, age: age, user_id: user_id, cat_image: cat_image }
  end
end
