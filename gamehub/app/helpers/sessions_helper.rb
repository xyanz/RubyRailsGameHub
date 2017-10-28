module SessionsHelper
  # Create session id based on user ID
  def log_in(user)
    session[:user_id] = user.id
  end
  # Set current user to itself if exists otherwise set user
  # to user with matching session ID
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def current_user?(user)
    user == current_user
  end
  # If current user exists, return true
  def logged_in?
    !current_user.nil?
  end
  # Delete session with matching user ID to log out user
  # Clear @current_user variable
  def log_out
     session.delete(:user_id)
     @current_user = nil
  end
  # Get default path or save url for later redirect
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
