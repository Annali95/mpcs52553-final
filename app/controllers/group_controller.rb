# Group
#   name: string
#   create_time: text
#   detail: text
class GruopController < ApplicationController
	def new
		@group = Group.new
	end

	def show
		@group = Group.find_by(id: params["id"])
	end

	def edit
		@group = Group.find_by(id: params["id"])
	end

	def create
		group = Group.new
		group.name = params["name"]
		group.create_time = params["create_time"]
		group.detail = params["detail"]
		group.save
		redirect_to "/group"
	end

	def update
		@group = Group.find_by(id: params["id"])
	    @group.name = params["name"]
		@group.create_time = params["create_time"]
		@group.detail = params["detail"]
		@group.save
		redirect_to "/group"
  end

  def destroy
  	group = Group.find_by(id: params["id"])
    group.delete
    redirect_to "/group"
  end

  def index
    # page_params = params.permit(:page)
    @group = Group.all
    if params["page"].present?
      page_number = params["page"].to_i
      @group = @group.limit(5).offset(5*page_number)
    end
  end




end



class ArticleController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(id: params["id"])
  end

  def index
    # page_params = params.permit(:page)
    @article = Article.all
    if params["page"].present?
      page_number = params["page"].to_i
      @article = @article.limit(5).offset(5*page_number)
    end
  end

  def edit
    @article = Article.find_by(id: params["id"])
  end

  def create
    article = Article.new
    article.title = params["title"]
    article.content = params["content"]
    article.user_id = params["user_id"]
    article.post_time = params["post_time"]
    article.category = params["category"]
    article.save
    redirect_to "/article"
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
    redirect_to "/article"
  end
# Article
#   category: text
#   title: text
#   content: text  
#   post_time: text
#   user_id: integer

end
