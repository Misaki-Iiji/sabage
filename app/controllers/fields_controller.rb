class FieldsController < ApplicationController

  def new #写真
    @field = Field.new(picture_params)
    @field.pictures.build
  end

  def create #写真
    @field = Field.new(picture_params)
    @field.save
    redirect_to 'pictures_path'
  end

  def mypage
    @field = Field.find(params[:id])
  end

  def index #ランキング
    @field = Field.all
  end

  def show
    @field = Field.find(params[:id])
  end

  def edit #フィールド詳細
    @field = Field.find(params[:id])
  end

  def update #フィールド詳細
    @field = Field.find(params[:id])
    if @field.update(field_params)
      redirect_to mypage_field_path(@field.id)
    else
      @field = Field.find(current_field[:id])
      render 'mypage'
    end
  end

  private
  def field_params
    params.require(:field).permit(:name, :image, :address, :introduction, :email)
  end

  def picture_params
    params.permit(pictures_pictures: [])
  end
end
