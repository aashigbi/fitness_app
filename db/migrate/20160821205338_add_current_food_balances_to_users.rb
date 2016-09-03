class AddCurrentFoodBalancesToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.decimal :daily_calories
  		t.decimal :calories_consumed
  		t.decimal :calories_remaining
  		t.decimal :daily_carbs
  		t.decimal :carbs_consumed
  		t.decimal :carbs_remaining
  		t.decimal :daily_protein
  		t.decimal :protein_consumed
  		t.decimal :protein_remaining
  		t.decimal :daily_fat
  		t.decimal :fat_consumed
  		t.decimal :fat_remaining
  	end
  end
end
