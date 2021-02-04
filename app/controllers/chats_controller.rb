class ChatsController < ApplicationController
  
  def index
    @rooms = current_user.user_rooms.pluck(:room_id)
  end
  
  def show
    @user = User.find(params[:id])
    #ログインしているユーザーのidが入ったroom_idのみを配列で取得（該当するroom_idが複数でも全て取得）
    rooms = current_user.user_rooms.pluck(:room_id)
    #user_idが@userかつroom_idが上で取得したrooms配列の中にある数値のもののみ取得
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil? #上記で取得できなかった場合の処理
      #新しいroomを作成して保存
      @room = Room.new
      @room.save
      #@room.idと@user.idをUserRoomのカラムに保存
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      #@room.idとcurrent_user.idをUserRoomのカラムに保存
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      #取得している場合は、user_roomsに紐づいているroomテーブルのレコードを@roomに代入
      @room = user_rooms.room
    end
    #if文の中で定義した@roomに紐づくchatsテーブルのレコードを代入
    @chats = @room.chats
    #@room.idを代入したChat.newを用意しておく
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end