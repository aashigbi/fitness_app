class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :brand
      t.string :item
      t.string :serving_size
      t.decimal :servings
      t.decimal :calories
      t.decimal :protein
      t.decimal :carbs
      t.decimal :sugars
      t.decimal :fiber
      t.decimal :fat

      t.timestamps
    end
  end
end
