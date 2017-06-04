class ArticlesController < ApplicationController
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
    if session["user_id"].present?
      uid = session["user_id"]
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



  def edit
    @article = Article.find_by(id: params["id"])
  end

  def like
    @article = Article.find_by(id: params["id"])
    @article.like = @article.like+1
    @article.save
    render 'show'
  end
  def secret
    if params["key"]==Article.find_by(id: params["id"]).key
      redirect_to "/articles/#{params["id"]}", notice: "You enter the right password!"
    else
      redirect_to "/articles", notice: "Wrong password"
      #can we link javascript inside?
    end
  end
  
  def create
    if session["user_id"].present?
      article = Article.new
      article.title = params["title"]
      article.content = params["content"]
      article.post_time = Time.parse(DateTime.now.to_s)
      article.category = params["category"]
      article.user_id = session["user_id"]
      article.url = params["url"]
      article.secret = params["secret"]
      article.key = params["key"]
      article.like = 0
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
    redirect_to "/myarticles"


  end

  def update
    @article = Article.find_by(id: params["id"])
    @article.title = params["title"]
    @article.content = params["content"]
    @article.url = params["url"]
    @article.secret = params["secret"]
    @article.key = params["key"]
    @groupArticle = GroupArticle.find_by(article_id: params["id"])
    @groupArticle.group_id = params["group_id"]
    @groupArticle.save
    @article.save
    render 'show'
  end

  def destroy
    article = Article.find_by(id: params["id"])
    groupArticle = GroupArticle.find_by(article_id: params["id"])
    article.delete
    groupArticle.delete
    redirect_to :back

  end
# Article
#   category: text
#   title: text
#   content: text  
#   post_time: text
#   user_id: integer

end
