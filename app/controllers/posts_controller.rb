class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = @posts.max_by { |p| p.created_at }
  end

  def show
    @posts = Post.all
    @post = @posts.detect{ |p| p.id == params[:id].to_i }
    render index
  end

end
