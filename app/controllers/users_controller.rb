class UsersController < ApplicationController

    before_action :set_users, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha Blog, #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = 'User data was updated successfully.'
            redirect_to user_path
        else
            render 'edit'
        end   
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_users
        @user = User.find(params[:id])
    end  


end