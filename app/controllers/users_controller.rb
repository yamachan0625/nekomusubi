class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(12)
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: '編集が完了しました'
      #redirect先指定する posts#index
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :address ,:introduction, :avatar)
  end
end
