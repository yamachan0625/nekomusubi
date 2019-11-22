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
    @post = Post.find(params[:id])
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
