class JoinFoodsAndUsersTables < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :foods, :users do |t|
  		t.index :food_id
  		t.index :user_id
  	end
  end
end
