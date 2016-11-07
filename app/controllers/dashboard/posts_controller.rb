class Dashboard::PostsController < Dashboard::BaseController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_user.company.posts.desc.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to dashboard_posts_path,
                  notice: "Post was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_posts_path, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = current_user.company.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :private, :attachment, :summary)
  end
end
