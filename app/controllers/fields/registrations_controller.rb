# frozen_string_literal: true

class Fields::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters_fields, if: :devise_controller?

  # 論理削除
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end

  protected

  # フィールド認証機能の前にここが行われる
  def configure_permitted_parameters_fields
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  end
end
