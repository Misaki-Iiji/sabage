# frozen_string_literal: true

class Fields::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_resource)
    field_path(current_field) # ログイン後ページ
  end
end
