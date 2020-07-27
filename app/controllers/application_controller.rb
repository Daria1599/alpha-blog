class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] # метод будет искать пользователя в том случае если он еще не найден ( ||= означает "не равно")
    end

    def logged_in?
        !!current_user # уточняет если current_user is true
    end

    def require_user # метод уточняет залогинен ли юзер (если этот метод добавлен в действие то действие не будет сделано)
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
