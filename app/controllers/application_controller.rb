class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    if session[:userid].present?
      Current.user = User.find_by(id: session[:userid])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in" if Current.user.nil?
  end
end
