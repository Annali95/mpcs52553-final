# Group
#   name: string
#   create_time: text
#   detail: text
class GroupController < ApplicationController
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
		@group.detail = params["detail"]
		@group.save
		render 'show'
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

  def mygroup
    if cookies["user_id"].present?
      uid = cookies["user_id"]
      @connection = Connection.where(user_id: uid).find_each
      # @article = Article.find_by(user_id: uid)
      if params["page"].present?
        page_number = params["page"].to_i
        @group = @group.limit(5).offset(5*page_number)
      end
    else
      redirect_to "/", notice: "Please log in first!"
    end

  end




end



