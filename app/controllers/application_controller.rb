class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] # метод будет искать пользователя в том случае если он еще не найден ( ||= означает "не равно")
    end

    def logged_in?
        !!current_user # уточняет если current_user is true
    end
end
