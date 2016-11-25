class DashboardController < ApplicationController
	before_action :authenticate_user!
	def index
		@shares = ElderShare.where("receiver_id = ?",current_user.id) rescue nil
		
	end
end
