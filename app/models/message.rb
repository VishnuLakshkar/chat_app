class Message < ApplicationRecord
	belongs_to :user
	belongs_to :conversation

	validates :body, :user_id, :conversation_id, presence: true
end