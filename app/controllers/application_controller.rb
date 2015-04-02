class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def set_current_user
    user = nil
    authenticate_with_http_token do |token, options|
      user = User.find_by(api_token: token)
    end
    if user
      sign_in(user)
    else
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: { errors: { user: ['Invalid token.']}}, status: 401
      false
    end
  end

  private

  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?

      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: 'You must be signed in to view this page.'}
    end
  end

end
