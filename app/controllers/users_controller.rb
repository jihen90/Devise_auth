class UsersController < ApplicationController
    before_action :authorize_admin!, only: [:dashboard]

    def show
        @user = User.find(params[:id])        
        @stories = @user.stories
    end

    def dashboard
        @users = User.all
        @stories = Story.all
    end

    def edit
        @user = User.find(params[:id])   
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to panel_admin_path
        else
            render 'edit'
        end
    end

    private

    def user_params
      params.require(:user).permit(:admin, :name, :email)
    end

end