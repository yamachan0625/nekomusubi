class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :authenticate_user!
  before_action :configure_account_update_params, only: [:profile_update, :profile_edit]
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
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
@ -50,10 +38,7 @@ class Users::RegistrationsController < Devise::RegistrationsController
  #   super
  # end

  protected
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar, :address, :introduction, :remove_avatar])
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
@ -61,6 +46,9 @@ class Users::RegistrationsController < Devise::RegistrationsController
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end