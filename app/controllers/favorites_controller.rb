class FieldFavosController < ApplicationController

  def show
    @user = current_user
  end

  def create
    @field = Field.find(params[:field_id])
    favorite = current_user.favorites.new(user_id: user.id)
    favorite.save
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end

  def destroy
    field = Field.find(params[:field_id])
    favorite = current_user.field_favos.find_by(field_id: field.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end


end
