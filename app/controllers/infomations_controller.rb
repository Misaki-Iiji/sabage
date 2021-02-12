class InfomationsController < ApplicationController
  before_action :authenticate_any!

  def index
    @infomations = Infomation.order(id: 'DESC').all.limit(15)
  end

  def show
    @infomation = Infomation.find(params[:id])
    @infomation_comment = InfomationComment.new
    @field = @infomation.field
  end

  def new
    @infomation = Infomation.new
  end

  def create
    @infomation = Infomation.new(infomation_params)
    @infomation.field_id = current_field.id
    if @infomation.save
      redirect_to @infomation
      flash[:notice] = '投稿しました'
    else
      render 'new'
      flash[:notice] = '投稿に失敗しました'
    end
  end

  def edit
    @infomation = Infomation.find(params[:id])
  end

  def update
    @infomation = Infomation.find(params[:id])
    if @infomation.update(infomation_params)
      redirect_to @infomation
      flash[:notice] = '更新しました'
    else
      # @infoamtion = Infomation.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    @infomation = Infomation.find(params[:id])
    @infomation.field_id = current_field.id
    @infomation.destroy
    redirect_to infomations_path
    flash[:notice] = '削除しました'
  end

  private

  def infomation_params
    params.require(:infomation).permit(:title, :body)
  end
end
