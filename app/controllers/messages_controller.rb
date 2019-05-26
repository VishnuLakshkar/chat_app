class MessagesController < ApplicationController
	def index
		@conversation = Conversation.includes(:recipient).find(params[:conversation_id])
		unless ( @conversation.sender.is_blocked?( @conversation.recipient) || 
			@conversation.recipient.is_blocked?( @conversation.sender ))
    	@messages = @conversation.messages.all
    else
    	redirect_to current_user
    end
	end

	def create
		@conversation = Conversation.includes(:recipient).find(params[:conversation_id])
    # @message = @conversation.messages.build(message_params)
    if !params[:message][:body].blank?
    	@message = @conversation.messages.create(message_params)
    else
    	flash.now[:danger] = "Message can not be empty"
    	debugger
    end
	end

	private
	def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
