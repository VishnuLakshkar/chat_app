class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:blocker_id])
		current_user.block(user)
		redirect_to current_user
	end

	def destroy
		# Change model name (Relationship)
  	user = Relationship.find(params[:id]).blocker
		current_user.unblock(user)
		redirect_to user
	end
end
