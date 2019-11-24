class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
