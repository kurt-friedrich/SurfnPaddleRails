class PostsController < ApplicationController

  def index
    posts
    @post = @posts.max_by { |p| p.created_at }
    @posts -= [@post]
  end

  def show
    posts
    @post = Post.find(params[:id].to_i)
    @posts -= [@post]
    render 'index'
  end

end
