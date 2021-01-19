class FieldsController < ApplicationController
  def mypage
    @field = Field.find(params[:id])
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end
end
