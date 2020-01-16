class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    gon.current_user_id = current_user.id #jsで使用
    gon.avatars = []
    user_all = User.all
    user_all.each do |u|
      gon.avatars << u.avatar.url #userのavatarのみを配列に追加
    end

    @room = Room.find(params[:id])
    entry_all = Entry.where(user_id: current_user.id)
    @current_user_rooms_id = []
    entry_all.each do |e|
      @current_user_rooms_id << e.room_id
    end

    rooms = Room.all
    @last_messages =[]
    current_user_rooms = [] #ログインしているユーザーが所属しているルーム
    @current_user_rooms_id.each do |i|
      current_user_rooms << rooms.find(i)
      if Room.find(i).messages.last == "" #自分が属するルームの最後のメッセージを配列に追加
        @last_messages << nil
      else
        @last_messages << Room.find(i).messages.last
      end
    end
    

    dm_member_id = []
    current_user_rooms.each do |room| #ログインしているユーザーが所属しているルームをeachで回す
      room.entries.each do |room_entry| #そのDMの子要素のentriesを配列で取得しeachで回す
        unless room_entry.user_id == current_user.id #ルームに所属している相手のuser_idを
          dm_member_id << room_entry.user_id        #新しい配列に追加する
        else
        end
      end
    end

    @dm_member = []
    dm_member_id.each do |member| #取得したUse_idを使って相手ユーザーを取得し
      @dm_member << User.find(member) #配列に追加する
    end

    #現在ログインしているユーザーのidとそれにひもづくルームのidをwhereメソッドで探しifで条件分岐
    if Entry.where(user_id: current_user.id,room_id: @room.id).present? 
      @messages = @room.messages
      @my_message = []
      @your_message = []
      @messages.each do |message| #メッセージをeachで回し自分のメッセージと相手のメッセージをそれぞれ違う配列に追加
        if message.user_id == current_user.id
          @my_message << message
        else
          @your_message << message
        end
      end

      @message = Message.new #メッセージ作成のためにインスタンスの生成
      @entries = @room.entries #ルームにひもづくentriesテーブルの自分と相手の二人分の情報を取り出し代入
      @entries.each do |entry| #二人entryテーブルのレコードをeachで回し、
        unless entry.user_id == current_user.id  #自分じゃない相手のuser_idを取得
          @entry_opponent_id = entry.user_id
        end
      end
      @entry_opponent = User.find(@entry_opponent_id)
    else
      redirect_to root_path #前のページにリダイレクト
    end
  end


  def new_message
    room = Message.find(params[:id]).room
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_messages = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = room.messages.where("id > #{last_messages}")
  end

end
