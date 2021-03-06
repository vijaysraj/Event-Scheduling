class UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token

	def new
		@user = User.new
		respond_to do |format|
			format.js{}
		end
	end

	def check_email
		@user = User.find_by_email(params[:user][:email])

		respond_to do |format|
			format.json { render :json => !@user }
		end
	end

	def create
		@user= User.new(user_params)
		if @user.valid? && @user.errors.blank?
			@user.save
			session[:user_id] = @user.id
			respond_to do |format|

				format.html{
					redirect_to  events_path, :notice => "Signed up!"
				}
				format.js{
					redirect_to(events_path, :notice => 'Account created Successfully.')
				}
			end

		else
			redirect_to root_path, :notice => "error!"

		end

	end

	def index
	end

	private

	def user_params

		params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
	end

end