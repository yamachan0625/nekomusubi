class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: [:facebook, :google_oauth2, :twitter]

          mount_uploader :avatar, AvatarUploader
          has_many :posts, dependent: :destroy
          
          def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.nickname = auth.info.name
            user.email = User.dumy_email(auth)
            user.password = Devise.friendly_token[0,20]
          end
        end

        private

  def self.dumy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com" #POINT
  end
  
end
