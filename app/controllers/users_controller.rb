class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def goals
  	if @user.save
  		render 'user_home'
  	else
  		render 'goals'
  	end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		render 'user_home'
  	else
  		render 'new'
  	end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.save
  		render 'user_home'
  	else
  		render 'goals'
  end

  def show
  end
 
 end


private

def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation) #separates parameters into aspects that are required (users) and permitted entries (avoiding any others for security purposes)
	end

end
