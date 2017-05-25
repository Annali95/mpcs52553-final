class ConnectionController < ApplicationController
	def new
		@connection = Connection.new
	end

	def showmember
		@connection = Connection.where(group_id: params["id"]).find_each
	end

	def create
		connection = Connection.new
		connection.group_id = params["name"]
		connection.user_id = session["user_id"]
		connection.detail = params["detail"]
		connection.save
		redirect_to "/mygroups"
	end
	def addmember
		if Connection.find_by(group_id: params["group_id"],user_id: session["user_id"]).present?
			redirect_to "/group",notice: "You already in this Group"
		else
		connection = Connection.new
		connection.group_id = params["group_id"]
		connection.user_id = session["user_id"]
		# connection.detail = params["detail"]
		connection.save
		redirect_to "/group"
	    end

	end


	def destroy
  	connection = Connection.find_by(id: params["id"])
    connection.delete
    redirect_to "/mygroups"
    end
end



# Connection
#   group_id: integer
#   user_id: integer
#   detail: text



