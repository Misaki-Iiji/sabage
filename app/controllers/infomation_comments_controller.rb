class InfomationCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    infomation = Infomation.find(params[:infomation_id])
    comment = current_user.infomation_comments.new(infomation_comment_params)
    comment.infomation_id = infomation.id
    comment.save
    redirect_to infomation_path(infomation)
  end

  def destroy
    InfomationComment.find_by(id: params[:id], infomation_id: params[:infomation_id]).destroy
    redirect_to infomation_path(params[:infomation_id])
  end

  private

  def infomation_comment_params
    params.require(:infomation_comment).permit(:comment)
  end
end
