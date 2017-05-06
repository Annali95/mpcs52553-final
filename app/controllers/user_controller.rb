class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # instant variable(not go out of scope)
    @user = User.new
    @user.mail = params["mail"]
    @user.name = params["name"]
    @user.password = params["password"]
    if @user.save
      redirect_to "/", notice: "Thanks for signing up!"
    else
      # redirect_to "/users/new", notice: "Please try again!"
      render 'new'
  end
  end
end

