class RoomsController < ApplicationController

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    @entry_all = Entry.where(user_id: current_user.id)
    @current_user_rooms_id = []
    @entry_all.each do |e|
      @current_user_rooms_id << e.room_id
    end
    @rooms = Room.all
    @current_user_rooms = [] #ログインしているユーザーが所属しているDM
    @current_user_rooms_id.each do |i|
      @current_user_rooms << @rooms.find(i)
    end

    @room_id = []
    @dm_member_id = []
    @current_user_rooms.each do |room| #ログインしているユーザーが所属しているDMをeachで回す
      room.entries.each do |room_entry| #そのDMの子要素のentriesを配列で取得しeachで回す
        unless room_entry.user_id == current_user.id #DMに所属している２名のうち自分のuser_idじゃないuserのidを
          @dm_member_id << room_entry.user_id                    #新しい配列に追加する
          @room_id << room_entry.room_id
        else  
        end
      end
    end

    @dm_member = []
    @dm_member_id.each do |member| #取得したUse_idを使ってユーザーを取得し
      @dm_member << User.find(member) #配列に追加する
    end


    #現在ログインしているユーザーのidとそれにひもづくルームのidをwhereメソッドで探しifで条件分岐
    if Entry.where(user_id: current_user.id,room_id: @room.id).present? 
      @messages = @room.messages
      @my_message = []
      @your_message = []
      @messages.each do |message|
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
      redirect_back(fallback_location: root_path) #前のページにリダイレクト
    end

  end

  def new_message
    room = Message.find(params[:id]).room  
    last_messages = params[:id].to_i
    @messages = room.messages.where("id > #{last_messages}")
  end

end
