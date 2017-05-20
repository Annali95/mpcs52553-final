class ArticleController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(id: params["id"])
  end

  def index
    @article = Article.all

    if params["page"].present?
      page_number = params["page"].to_i
      @article = @article.limit(5).offset(5*page_number)
    end
  end

  def myarticle
    if cookies["user_id"].present?
      uid = cookies["user_id"]
      @article = Article.where(user_id: uid).find_each
      # @article = Article.find_by(user_id: uid)
      if params["page"].present?
        page_number = params["page"].to_i
        @article = @article.limit(5).offset(5*page_number)
      end
    else
      redirect_to "/", notice: "Please log in first!"
    end

  end

  def grouparticle
    
    @grouparticle = GroupArticle.where(group_id: params["group_id"]).find_each
    if params["page"].present?
      page_number = params["page"].to_i
      @grouparticle = @grouparticle.limit(5).offset(5*page_number)
    end

  end


  def edit
    @article = Article.find_by(id: params["id"])
  end

  def create
    if cookies["user_id"].present?
    article = Article.new
      article.title = params["title"]
      article.content = params["content"]
      article.post_time = params["post_time"]
      article.category = params["category"]
      article.user_id = cookies["user_id"]
      article.save
    else
      redirect_to "/", notice: "Please log in first!"
    end
    if params["group_id"].present?
      @groupArticle = GroupArticle.new
      @groupArticle.group_id = params["group_id"]
      @groupArticle.article_id = article.id
      @groupArticle.save
    end
    redirect_to "/myarticle"


  end

  def update
    @article = Article.find_by(id: params["id"])
    @article.title = params["title"]
    @article.content = params["content"]
    @article.user_id = params["user_id"]
    @article.post_time = params["post_time"]
    @article.category = params["category"]
    @article.save
    redirect_to "/article"
  end

  def destroy
    article = Article.find_by(id: params["id"])
    article.delete
    redirect_to :back

  end
# Article
#   category: text
#   title: text
#   content: text  
#   post_time: text
#   user_id: integer

end
