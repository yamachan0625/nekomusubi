class UsersController < ApplicationController

  before_action :message_user, only: [:show]

  include CreateMessageRoom
  before_action :set_message, only: [:show]

  def show
    @posts = Post.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(12)
    if Entry.find_by(user_id: @user.id).present?
      @room_id = Entry.find_by(user_id: @user.id).room_id
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

  def message_user
    @user = User.find(params[:id])
  end

end
