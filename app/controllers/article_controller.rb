class ArticleController < ActionController::Base
  def new
    @article = Article.new
  end

  def create
    # instant variable(not go out of scope)
    @article = Article.new
    @article.title = params["title"]
    @article.essay = params["password"]
    if @user.save
      redirect_to "/", notice: "Thanks for signing up!"
    else
      # redirect_to "/users/new", notice: "Please try again!"
      render 'new'
    end
  end
end
