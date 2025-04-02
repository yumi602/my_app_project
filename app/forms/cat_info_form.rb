class CatInfoForm
  include ActiveModel::API

  attr_accessor :name, :age, :user_id, :food, :body, :cat_image, :food_image

  def initialize(attributes = {})
    super
    # cat_imageがアップロードファイルならキャッシュする
    if attributes[:cat_image].is_a?(ActionDispatch::Http::UploadedFile)
      self.cat_image = CatImageUploader.new
      self.cat_image.cache!(attributes[:cat_image])
    end

    if attributes[:food_image].is_a?(ActionDispatch::Http::UploadedFile)
      self.food_image = FoodImageUploader.new
      self.food_image.cache!(attributes[:food_image])
    end
  end

  def save
    cat = Cat.create(name: name, age: age, user_id: user_id, cat_image: cat_image)

    return false unless cat.persisted?

    Food.create(cat_id: cat.id, food: food, body: body, food_image: food_image)

    true
  end
end
