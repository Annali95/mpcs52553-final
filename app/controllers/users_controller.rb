class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params["id"])
    # if @user.id != session["user_id"]
    #   redirect_to "/", notice:"We called the police!"
    # end
  end

  def update
    @user = User.find_by(id: params["id"])
    @user.name = params["name"]
    @user.password = params["password"]
    @article.save
    render 'show'
  end
  def edit
    @user = User.find_by(id: params["id"])
  end

  def create
    @user = User.new
    @user.mail = params["mail"]
    @user.name = params["name"]
    @user.admin = 0
    @user.password = params["password"]
    if @user.save
      redirect_to "/login", notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end
end
