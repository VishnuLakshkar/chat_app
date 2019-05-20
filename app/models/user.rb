class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 25 }
  validates :phone_number, uniqueness: true, 
						  	numericality: { only_integer: true, message: "should be 10 digits" },
						  	length: { is: 10, message: "Must be 10 digits" }

  # Block Unblock relationship
	has_many :blocked_relationships, class_name: "BlockRelationship", 
            foreign_key: "blocked_id", dependent: :destroy
  has_many :blockers, through: :blocked_relationships, source: :blocker

  has_many :blocker_relationships, class_name: "BlockRelationship", 
            foreign_key: "blocker_id", dependent: :destroy
  has_many :blockeds, through: :blocker_relationships, source: :blocked

  def block(other_user)
  	blockers << other_user
  end

  def unblock(other_user)
  	blockers.delete(other_user)
  end

  def is_blocked?(other_user)
  	blockers.include?(other_user)
  end
end