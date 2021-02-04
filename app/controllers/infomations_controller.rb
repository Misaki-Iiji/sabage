class InfomationsController < ApplicationController
  before_action :authenticate_field!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @infomations = Infomation.all.limit(15)
  end

  def show
    @infomation = Infomation.find(params[:id])
    @infomation_comment = InfomationComment.new
    @field = Field.find(params[:id])
  end

  def new
    @infomation = Infomation.new
  end

  def create
    @infomation = Infomation.new(infomation_params)
    @infomation.field_id = current_field.id
    if @infomation.save
      redirect_to @infomation
    else
      render 'new'
      flash[:notice] = "タイトルを記入してください"
    end
  end

  def edit
    @infomation = Infomation.find(params[:id])
  end

  def update
    @infomation = Infomation.find(params[:id])
    if @infomation.update(infomation_params)
      redirect_to @infomation
    else
      # @infoamtion = Infomation.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    @infomation = Infomation.find(params[:id])
    @infomation.destroy
    redirect_to infomations_path
    flash[:notice] = "削除しました"
  end

  private

  def infomation_params
      params.require(:infomation).permit(:title, :body)
  end

end
