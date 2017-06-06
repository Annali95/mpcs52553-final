class SessionsController < ApplicationController

  def destroy
    session.delete("user_id")
    redirect_to "/", notice: "See ya!"
  end

  def new

  end

  def create
    user = User.find_by(mail: params["mail"])
    if user.present?
      if user.authenticate(params["password"])
        session["user_id"] = user.id

        redirect_to "/", notice: "Welcome back, #{user.name}"
      else
        redirect_to "/login", notice: "Wrong Password"
      end
    else
      redirect_to "/login", notice: "User name doesn't exist"
    end
  end

end
