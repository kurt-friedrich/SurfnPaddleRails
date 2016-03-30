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
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :new
    end
  end

  def show
    posts
    @post = Post.find(params[:id].to_i)
    @posts -= [@post]
    render 'index'
  end

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

end
