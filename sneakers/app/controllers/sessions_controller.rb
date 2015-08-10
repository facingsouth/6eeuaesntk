class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "You have signed in"
      redirect_to @user
    else
      flash.now[:error] = "We couldn't sign you in"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have signed out"
    redirect_to root_path
  end
end
