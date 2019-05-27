class ConversationsController < ApplicationController
	def create
		@conversation = Conversation.get(current_user.id, params[:user_id])
		redirect_to conversation_messages_path(@conversation)
	end

	def index
		@conversated_users = Conversation.all.map { |conversated_users| conversated_users.opposed_user(current_user) }.uniq
	end
end
