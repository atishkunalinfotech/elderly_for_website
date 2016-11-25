class FriendsController < ApplicationController
	before_filter :authenticate_user!
	def index
	  	@user = current_user.requested_friends
	  	@user_friends = current_user.friends
	  	@user_pending = current_user.pending_friends
	end

	def find_friend
        search_condition = "%" + params[:fullname] + "%"
		@user_friends = User.where('fullname LIKE ?',search_condition)
	end
end
