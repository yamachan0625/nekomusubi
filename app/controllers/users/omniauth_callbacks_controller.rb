# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  private

  def callback_from(provider)
    provider = provider.to_s #プロバイダを定義
    @user = User.from_omniauth(request.env['omniauth.auth']) #モデルでSNSにリクエストするメソッド（from_omniauth）を使用し、レスポンスを@userに代入
    if @user.persisted? #@userがすでに存在したらログイン処理、存在しなかったら残りの登録処理へ移行
      sign_in @user
      redirect_to root_path
    else
      #今回は複数ページに渡る登録項目があるため、情報をsessionに保存し、他のページにも持ち越せるように
      #この辺りの値は用途に合わせてアレンジしてください。
      session[:password] = @user.password
      session[:password_confirmation] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      redirect_to registration_signup_index_path
    end
  end

end
