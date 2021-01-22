class FieldFavosController < ApplicationController

  def show
    @user = current_user
  end

  def create
    field = Field.find(params[:field_id])
    field_favo = current_user.field_favos.new(field_id: field.id)
    field_favo.save
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end

  def destroy
    field = Field.find(params[:field_id])
    field_favo = current_user.field_favos.find_by(field_id: field.id)
    field_favo.destroy
    redirect_back(fallback_location: root_path)#うまくいかなかった場合ルートパスに飛ぶ
  end


end
