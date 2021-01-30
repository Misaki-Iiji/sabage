# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    user_path(current_user) #ログイン後ページ
  end
end
