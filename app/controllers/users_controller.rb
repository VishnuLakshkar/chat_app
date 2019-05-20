class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
    @user = User.find(params[:id])
	end

	def blocked_user
    @user  = User.find(params[:id])
    @users = @user.blockers
    render 'block_list'
  end
end
