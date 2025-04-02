class AddFoodImageToFoods < ActiveRecord::Migration[7.2]
  def change
    add_column :foods, :food_image, :string
  end
end
