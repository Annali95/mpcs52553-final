class GrouparticlesController < ApplicationController

	def show   
	    @grouparticle = GroupArticle.where(group_id: params["group_id"]).find_each
	    if params["page"].present?
	      page_number = params["page"].to_i
	      @grouparticle = @grouparticle.limit(5).offset(5*page_number)
	    end
	end
end