class ApplicationController < ActionController::Base
  def authenticate_any!
    return true if field_signed_in?

    authenticate_user!
  end
end
