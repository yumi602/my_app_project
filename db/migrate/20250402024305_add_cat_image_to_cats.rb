class AddCatImageToCats < ActiveRecord::Migration[7.2]
  def change
    add_column :cats, :cat_image, :string
  end
end
