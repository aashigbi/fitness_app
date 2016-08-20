class AddGoalInfoToUserProfile < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.decimal :target_weight
  		t.decimal :current_weight
  		t.string :desired_pace
  		t.decimal :current_bodyfat
  		t.string :activity_level
  		t.decimal :carb_percent
  		t.decimal :protein_percent
  		t.decimal :fat_percent
  	end
  end
end
