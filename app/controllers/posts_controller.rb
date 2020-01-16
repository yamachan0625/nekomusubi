class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:destroy, :edit, :update, :show]
  before_action :new_post, only: [:index, :search]
  before_action :set_marker_index, only: [:index]
  before_action :set_marker_show, only: [:show]
  before_action :set_marker_search, only: [:search]
  before_action :message_user, only: [:show]
  

  include CreateMessageRoom
  before_action :set_message, only: [:show]

  include BuildMarkers
  before_action :set_markers, only: [:index, :show, :search]




  def index
    @posts = Post.all.order("created_at asc").page(params[:page]).per(12)
    @new_posts = Post.all.order("created_at desc").limit(5)
    # 一ヶ月以上経過した投稿は削除される
    @posts.each do |post|
      if Time.current > post.created_at+ 1.month
        post.delete
      end
    end
  end

  def show

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to post_path(@post.id) , alert: '削除できません'
    end
  end

  def search
    @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(12)
    @result = params[:search]
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :address, :image, :content,:latitude, :longitude, :remove_image)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def new_post
      @post = Post.new
    end

    def message_user
      @user = @post.user
    end

    def set_marker_index
      @map_posts = Post.all
    end

    def set_marker_show
      @map_posts = Post.find(params[:id])
    end

    def set_marker_search
      @map_posts = Post.search(params[:search])
    end

end
