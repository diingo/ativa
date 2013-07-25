module SessionsHelper
  def signed_in?
    if session[:remember_token] && User.find(session[:remember_token])
      true
    else
      false
    end
  end

  def current_user
    if signed_in?
      User.find(session[:remember_token])
    else
      nil
    end
  end
end
