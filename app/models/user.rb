class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise  :database_authenticatable, :registerable,
    	    :recoverable, :rememberable, :trackable, :validatable,
         	:confirmable
    has_many :user_category_groups
    has_many :category_groups, through: :user_category_groups
    has_many :blogs
end
