class PostsController < ApplicationController
  def index
    @posts = Post.public_posts.desc.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end
end
