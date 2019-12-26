class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :new_post, only: [:index, :search]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(12)
    @posts2 = Post.all
    gon.post = @post
    @hash = Gmaps4rails.build_markers(@posts2) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })
      marker.json({ id: post.id, })
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })

      marker.json({ id: post.id, })
    end

    @user = @post.user
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def destroy
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to :back , alert: '削除できません'
    end
  end

  def search
    @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page]).per(12)
    @result = params[:search]
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })

      marker.json({ id: post.id, })
    end
  end

  def edit
  end

  def update
    if @post.update!(post_params)
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

end
