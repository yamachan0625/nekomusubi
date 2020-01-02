class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      redirect_to posts_path
    end
  end
end
