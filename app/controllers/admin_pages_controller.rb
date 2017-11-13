class AdminPagesController < ApplicationController
	before_action :authenticate_user!
	before_action :admin!
	
	def index
	end	

	private
	
end
