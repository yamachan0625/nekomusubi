class UsersController < ApplicationController

  def index
  end

  def show
    @posts = Post.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(12)
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: '編集が完了しました'
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
