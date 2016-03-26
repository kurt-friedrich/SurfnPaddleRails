class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = @posts.max_by { |p| p.created_at }
    @posts -= [@post]
  end

  def show
    @posts = Post.sorted
    @post = Post.find(params[:id].to_i)
    @posts -= [@post]
    render 'index'
  end

end
