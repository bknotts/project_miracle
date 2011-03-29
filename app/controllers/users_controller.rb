class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to BookishMe"
      redirect_to @user
    else
      @title = "Sign Up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end
end
