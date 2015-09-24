class RelationshipsController < ApplicationController
	def create
  	@relationship = Relationship.new
		@relationship.followed_id = params[:followed_id]
		@relationship.follower_id = current_user.id
		if @relationship.save
        redirect_to User.find params[:followed_id]
    else
        flash[:error] = "Couldn't Follow"
        redirect_to root_url
    end
	end
	def destroy
    @relationship = Relationship.where(follower_id: current_user.id, followed_id: params[:id]).first_or_initialize
    @relationship.destroy
    redirect_to user_path params[:id]
	end
end