class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  	@user.save
  end

 def food
  	@user = User.find(params[:id])
  	# Determine user calorie target
    @user_rmr = (500 + (@user.current_weight/2.2) * (1- (@user.current_bodyfat/100)) * 22) 
  	if @user.activity_level = "Sedentary"
  		@user_rmr_and_activity = @user_rmr * 1.25
  	elsif @user.activity_level = "Lightly active"
  		@user_rmr_and_activity = @user_rmr * 1.55
  	elsif @user.activity_level = "Moderately active"
  		@user_rmr_and_activity = @user_rmr * 1.65
  	else
  		@user_rmr_and_activity = @user_rmr * 2
  	end

  	if @user.protein_percent > 30
  		@user_tef = @user_rmr * 0.15
  	else
  		@user_tef = @user_rmr * 0.1
  	end

  	if @user.desired_pace = "Lose 2 pounds a week"
  		@user_delta = -1000
  	elsif @user.desired_pace = "Lose 1 pound a week"
  		@user_delta = -500
  	elsif @user.desired_pace = "Maintain weight"
  		@user_delta = 0
  	elsif @user.desired_pace = "Gain 1 pound a week"
  		@user_delta = 500
  	else @user.desired_pace = "Gain 2 pounds a week"
  		@user_delta = 1000
  	end

  	@user.daily_calories = @user_rmr_and_activity + @user_tef + @user_delta

	@daily_calories = @user.daily_calories.round
	@user.save

  #Determine consumed calories

  @consumed_calories = 0

  #Determine burned calories

  @burned_calories = 0

  #Calculate remaining calories

  @remaining_calories = @daily_calories - @consumed_calories + @burned_calories

  @user.save

  #Calculate protein target

  @user.daily_protein = (@user.daily_calories * @user.protein_percent / 400).round
  @daily_protein = @user.daily_protein
  @user.save

  #Calculate protein consumed
  @consumed_protein = 0

  #Calculate protein remaining
  @remaining_protein = @daily_protein - @consumed_protein

  @user.save

  #Calculate carb target

  @user.daily_carbs = (@user.daily_calories * @user.carb_percent / 400).round
  @daily_carbs = @user.daily_carbs
  @user.save

  #Calculate carbs consumed
  @consumed_carbs = 0

  #Calculate carbs remaining
  @remaining_carbs = @daily_carbs - @consumed_carbs

  @user.save

  #Calculate fat target

  @user.daily_fat = (@user.daily_calories * @user.fat_percent / 900).round
  @daily_fat = @user.daily_fat
  @user.save

  #Calculate fat consumed
  @consumed_fat = 0

  #Calculate fat remaining
  @remaining_fat = @daily_fat - @consumed_fat

  @user.save

  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_goals_path(@user)
  	else
  		redirect_to 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		render 'home'
  	else
  		render 'goals'
  	end
  end

  def home
    @user = User.find(params[:id])
    @username = @user.name
  end
 
 end


private

def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :target_weight, 
		:current_weight, :desired_pace, :current_bodyfat, :activity_level, :carb_percent, :protein_percent, :fat_percent) #separates parameters into aspects that are required (users) and permitted entries (avoiding any others for security purposes)

end
