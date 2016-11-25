class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :friend, if: :authenticate_user!
  def after_sign_in_path_for(resource_or_scope)
    if current_user
    	if current_user.role == 'admin'
    		admin_root_path
    	else
  	    dashboard_path
  	  end
    end
  end

  # def friend
  #   @user_friends = current_user.friends.count 
  #   @elder_gallaries = current_user.elder_gallaries.count
  #   @elder_videos = current_user.elder_videos.count
  # end
end
