# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters #ユーザー機能の前にここが行われる
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
