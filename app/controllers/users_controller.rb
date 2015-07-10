class UsersController < ApplicationController
	def new
		@user = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user.new(user_params)

		if @user.save
			reidrect_to user_path(id: @user.id), notice: "Succesfully Signed Up"
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to user_path(id: @user.id), notice: "Successfully Updated"
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])

		if @user.destroy
			redirect_to users_path, notice: "Successfully Updated"
		else
			render :index
		end
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
