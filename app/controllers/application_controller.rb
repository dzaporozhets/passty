class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  before_filter :default_headers

  def default_headers
    headers['X-Frame-Options'] = 'DENY'
    headers['X-XSS-Protection'] = '1; mode=block'
  end

  def require_password
    password_confirmed = cookies[:password_confirmed]

    if password_confirmed
      password_confirmed_at = current_user.decrypt(password_confirmed) rescue nil
      return true if password_confirmed_at == Date.today.to_s
    end

    redirect_to new_password_check_path(redirect_to: request.url)
  end
end
