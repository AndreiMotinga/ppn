class PostsController < ApplicationController
  def index
    @posts = Post.public_posts
                 .includes(user: :company)
                 .desc
                 .page(params[:page])
  end

  def show
    @post = Post.includes(user: :company).find(params[:id])
  end
end
