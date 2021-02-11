class ApplicationController < ActionController::Base
  def authenticate_any!
    if field_signed_in?
      return true
    end
    authenticate_user!
  end
end
