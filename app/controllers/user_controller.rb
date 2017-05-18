class UserController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params["id"])
    if @user.id != session["user_id"]
      redirect_to "/", "We called the police!"
    end
  end

  def create
    @user = User.new
    @user.mail = params["mail"]
    @user.name = params["name"]
    @user.password = params["password"]
    if @user.save
      redirect_to "/", notice: "Thanks for signing up!"
    else
      # redirect_to "/users/new", notice: "Whoa, nice try!"
      render 'signup'
    end
  end
end
