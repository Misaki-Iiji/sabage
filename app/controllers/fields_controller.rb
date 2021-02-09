class FieldsController < ApplicationController
  before_action :authenticate_field!, only: [:edit] #index, ranking, showはフィールドでログインしてなくても見れる

  def index
    @q = Field.ransack(params[:q]) #検索ワードをparams[:q]で受け取り
    @fields = @q.result(distinct: true).page(params[:page]).per(10) #該当した結果をデータ表示
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
    @posts = Post.where(field_id: @field.id).order(id: "DESC").page(params[:page]).per(5)
    @infomations = @field.infomation.limit(4).order(id: "DESC")
  end

  def edit #フィールド詳細
    @field = Field.find(params[:id])
  end

  def update #フィールド詳細
    @field = Field.find(params[:id])
    if @field.update(field_params)
      redirect_to field_path(@field.id), notice: "フィールド情報をを編集しました"
    else
      @field = Field.find(current_field[:id])
      flash[:notice] = "フィールド名20文字、フィールド説明300文字まで"
      render 'edit'
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
