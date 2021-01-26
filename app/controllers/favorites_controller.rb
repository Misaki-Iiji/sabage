class FavoritesController < ApplicationController

  def show
    @user = current_user
  end

  def create
    field = Field.find(params[:field_id])
    favorite = current_user.favorites.new(field_id: field.id)
    favorite.save
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end

  def destroy
    field = Field.find(params[:field_id])
    favorite = current_user.favorites.find_by(field_id: field.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end


end
