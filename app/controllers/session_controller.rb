class SessionController < ApplicationController

  def destroy
    cookies.delete("user_id")
    redirect_to "/", notice: "See ya!"
  end

  def new

  end

  def create
    user = User.find_by(mail: params["mail"])
    if user.present?
      if user.password == params['password']
        cookies["user_id"] = user.id
        redirect_to "/", notice: "Welcome back, #{user.name}"
      else
        redirect_to "/login", notice: "Nice try."
      end
    else
      redirect_to "/login", notice: "Nice try."
    end
  end

end
