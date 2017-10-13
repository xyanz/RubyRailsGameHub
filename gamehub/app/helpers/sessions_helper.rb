module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def current_user?(user)
    user == current_user
  end
  def logged_in?
    !current_user.nil?
  end
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
