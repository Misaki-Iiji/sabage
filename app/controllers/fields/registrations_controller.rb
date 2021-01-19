# frozen_string_literal: true

class Fields::RegistrationsController < Devise::RegistrationsController

   before_action :configure_permitted_parameters_fields, if: :devise_controller?

  protected

  def configure_permitted_parameters_fields #フィールド認証機能の前にここが行われる
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
