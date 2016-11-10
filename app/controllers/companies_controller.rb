class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :public, :private]

  def show
  end

  def public
    ids = @company.admins.pluck(:id)
    @posts = Post.public_posts.desc.by_admins(ids).page(params[:page])
    render :posts
  end

  def private
    ids = @company.admins.pluck(:id)
    @posts = Post.private_posts.desc.by_admins(ids).page(params[:page])
    render :posts
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
