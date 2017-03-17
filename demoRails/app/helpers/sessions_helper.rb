module SessionsHelper
  def log_in(user)
      session[:user_id] = user.id
   end
   # Remembers a user in a persistent session.
    def remember(user)
      user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end
    def current_user?(user)
      user == current_user
    end

   def current_user
      @current_user ||= User.find_by(id: session[:user_id])
     end
   def logged_in?
      !current_user.nil?
    end
# Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end