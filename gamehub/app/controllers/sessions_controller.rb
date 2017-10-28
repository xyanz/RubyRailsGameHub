# Remember user temporarily
class SessionsController < ApplicationController
  def new
  end
  # Find by email because unique email validation in database setup
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Call log_in method in sessions_helper
      log_in user
      # Remember me functionality
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
