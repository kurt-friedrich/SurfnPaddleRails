class PostsController < ApplicationController

  def index
    posts
    @post = @posts.max_by { |p| p.created_at }
    @posts -= [@post]
  end

  def new
   posts
   @post = Post.new
  end

  def create
    posts
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    posts
    @post = Post.find(params[:id].to_i)
    @posts -= [@post]
  end

  def update
    @post = Post.find(params[:id].to_i)
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    posts
    @post = Post.find(params[:id].to_i)
    @posts -= [@post]
    render 'index'
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id, :image)
  end

end
