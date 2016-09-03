class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def goals
  	@user = User.find(params[:id])
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
  		render 'show'
  	else
  		render 'goals'
  end

  def show
  end

  def food
  	@user = User.find(session[:user_id])
	@daily_calories = @user.daily_calories
  end

 
 end


private

def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :target_weight, 
		:current_weight, :desired_pace, :current_bodyfat, :activity_level, :carb_percent, :protein_percent, :fat_percent) #separates parameters into aspects that are required (users) and permitted entries (avoiding any others for security purposes)

	end

end
