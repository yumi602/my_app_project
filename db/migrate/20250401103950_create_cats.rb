class CreateCats < ActiveRecord::Migration[7.2]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.integer :age, null: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
