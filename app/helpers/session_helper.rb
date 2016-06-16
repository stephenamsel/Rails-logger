module SessionHelper
  def log_in(user)
    reset_session
    session[:user_id] = user.id #Creates a cookie that expires with the session, storing the user ID
  end
  def log_out
    reset_session
    @current_user = nil
  end
  def current_user
    if session[:user_id].nil? then 
      return
    end
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
