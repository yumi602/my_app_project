class CreateFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :foods do |t|
      t.string :food, null: false
      t.text :body, null: true
      t.references :cat, foreign_key: true

      t.timestamps
    end
  end
end
