class FieldsController < ApplicationController
  before_action :authenticate_field!, only: [:edit] #index, ranking, showはフィールドでログインしてなくても見れる

  def index
    @field = Field.all
  end

  def ranking
      @all_ranks = Field.find(Favorite.group(:field_id).order('count(field_id) desc').limit(5).pluck(:field_id))
      # Favorite.group(:field_id)→field_idが同じものにグループを分ける
      # order('count(field_id) desc')→それを番号の多い順に並び替える
      # limit(3)→表示する最大数を3個に指定する
      # pluck(:field_id)→最後に:field_idカラムのみを数字で取り出すように指定。
      # Note.find()→最終的に、pluckで取り出される数字をfield_idとすることでいいね順に取得できる
      #＠all_ranksに代入
  end

  def show
    @field = Field.find(params[:id])
    @posts = Post.where(field_id: @field.id)

  end

  def edit #フィールド詳細
    @field = Field.find(params[:id])
  end

  def update #フィールド詳細
    @field = Field.find(params[:id])
    if @field.update(field_params)
      redirect_to mypage_field_path(@field.id), notice: "フィールド情報をを編集しました"
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
