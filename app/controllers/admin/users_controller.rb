class Admin::UsersController < ApplicationController
		def index
			@users = User.all
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
			if @user.save
				redirect_to admin_users_path
			else
				render :new
			end
		end

		def show
			@user = User.find(params[:id])
			@tasks = @user.tasks.order(id: "DESC")
		end

		def edit
			@user = User.find(params[:id])
		end

		def update
			@user = User.find(params[:id])
			if @user.update(user_params)
				flash[:success] = "更新されました"
				redirect_to edit_admin_user_path(@user)
			end
			flash[:danger] = "保存が失敗しました"
			render :edit
		end

		def destroy
			@user = User.find(params[:id])
			@user.destroy
			redirect_to admin_users_path
		end

		def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password
                                 )
  end
end
