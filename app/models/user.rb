class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 25 }
  validates :phone_number, uniqueness: true, 
						  	numericality: { only_integer: true, message: "should be 10 digits" },
						  	length: { is: 10, 
						  			message: "Must be 10 digits" }
end
