class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(12)
    if Entry.find_by(user_id: @user.id).present?
      @room_id = Entry.find_by(user_id: @user.id).room_id
    end


    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

  end


  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: '編集が完了しました'
    else
      redirect_to user_path(current_user.id), alert: '編集に失敗しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :address ,:introduction, :avatar)
  end
end
