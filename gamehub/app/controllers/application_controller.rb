class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  private
    # Checks if user is logged in when trying to access user restricted page
    # Store location of intended destination for redirect
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Log in to continue!"
        redirect_to login_url
      end
    end
end
