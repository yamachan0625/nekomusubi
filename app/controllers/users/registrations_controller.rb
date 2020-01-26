class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!
  before_action :configure_account_update_params, only: [:profile_update, :profile_edit]
  before_action :forbid_test_user, only: [:edit,:update,:destroy]
  def profile_edit
    redirect_to user_session_path, notice: 'ログインしてください' unless user_signed_in?
  end

  def profile_update
    current_user.assign_attributes(account_update_params)
    if current_user.save
	  redirect_to root_path, notice: 'プロフィールを更新しました'
    else
      render "profile_edit"
    end
  end


  protected
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar, :address, :introduction, :remove_avatar])
  end

  def forbid_test_user
    binding.pry
    if @user.email == "test@gmail.com"
      flash[:notice] = "テストユーザーのため変更できません"
      redirect_to root_path
    end
  end
end