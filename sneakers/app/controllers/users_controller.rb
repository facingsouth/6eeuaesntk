class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, new user!"
      redirect_to @user
    else
      flash.now[:error] = "Something went wrong."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, 
                                 :email, 
                                 :password, 
                                 :password_confirmation)
  end
end
