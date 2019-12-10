class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(12)
    @posts2 = Post.all
    @post = Post.new
    gon.post = @post
    @hash = Gmaps4rails.build_markers(@posts2) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })
      marker.json({ id: post.id, })
    end
  end

  def show
    @post_show = Post.find(params[:id])
    @hash = Gmaps4rails.build_markers(@post_show) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })

      marker.json({ id: post.id, })
    end

    @user = @post_show.user
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

  private
  def post_params
    params.require(:post).permit(:title, :address, :image, :content,:latitude, :longitude, :remove_image)
  end

end
