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

    @dm_member_id = []
    @current_user_rooms.each do |room| #ログインしているユーザーが所属しているDMをeachで回す
      room.entries.each do |room_entry| #そのDMの子要素のentriesを配列で取得しeachで回す
        unless room_entry.user_id == current_user.id #DMに所属している２名のうち自分のuser_idじゃないuserのidを
          @dm_member_id << room_entry.user_id                    #新しい配列に追加する
        else  
        end
      end
    end

    @dm_member = []
    @dm_member_id.each do |member|
      @dm_member << User.find(member)
    end

    #現在ログインしているユーザーのidとそれにひもづくルームのidをwhereメソッドで探しifで条件分岐
    if Entry.where(user_id: current_user.id,room_id: @room.id).present? 
      @messages = @room.messages
      @message = Message.new #メッセージ作成のためにインスタンスの生成
      @entries = @room.entries #ルームにひもづくentriesテーブルの自分と相手の２名分の情報を取り出し代入
    else
      redirect_back(fallback_location: root_path) #前のページにリダイレクト
    end

  end

end
