class FoodsController < ApplicationController
  
  def new
    @food = Food.new
  end

  def create
  	@food = Food.new(food_params)
  	if @food.save!
  		render 'users/home'
  	else
  		render 'new'
  	end
  end

  def index
    @foods = Food.all
  end

  def edit
    @food = Food.find(params[:id])
    @food.save!
  end

  def add
    @food = Food.find(params[:id])
  end

end

private

def food_params
		params.require(:food).permit(:brand, :item, :serving_size, :servings, :calories, 
		:protein, :carbs, :sugars, :fiber, :fat) #separates parameters into aspects that are required (users) and permitted entries (avoiding any others for security purposes)
end