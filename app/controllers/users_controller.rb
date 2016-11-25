class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy,:change_password,:update_password]
    #before_filter :correct_user

	def friend_request
		users = User.find(params[:friend_id])
		if users.present?
		  current_user.friend_request(users)
		  flash[:notice] = "Friend Request Sent!"
		  redirect_to friends_path
		else
		  flash[:notice] = "User not present!"
		  redirect_to root_path
		end
	end

	def accept_user
		users = User.find(params[:friend_id])
		if users.present?
		  current_user.accept_request(users)
		  flash[:notice] = "Friend Request accepted!"
		  redirect_to root_path
		else
		  flash[:notice] = "User not present!"
		  redirect_to root_path
		end
	end

	def reject_user
		users = User.find(params[:friend_id])
		if users.present?
		  current_user.decline_request(users)
		  flash[:notice] = "Friend Request rejected!"
		  redirect_to root_path
		else
		  flash[:notice] = "User not present!"
		  redirect_to root_path
		end
	end

	def remove_user
		users = User.find(params[:friend_id])
		if users.present?
		  current_user.remove_friend(users)
		  flash[:notice] = "Friend Request removed!"
		  redirect_to root_path
		else
		  flash[:notice] = "User not present!"
		  redirect_to root_path
		end
	end

	def edit
		
	end

	def show
		
	end

	def destroy
		@user.destroy
		flash[:notice] = "Deleted successfully."
        redirect_to :back
	end

	def update
  	if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def update_password
  	@user.password = user_params[:password]
  	if @user.save(validate: false)
      sign_in(@user, :bypass => true)
      flash[:notice] = 'Password updated.'
      redirect_to root_path
	else
	  flash[:notice] = "Error in updating password."
      redirect_to user_change_password_path
	end
  end

  private
	def user_params
      params.require(:user).permit(:fullname,:age,:email,:password,:password_confirmation,:country,:firstname,:lastname,:email,:gender,:username,:photo)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
