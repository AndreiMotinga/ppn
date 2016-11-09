require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "assigns only public posts as @posts" do
      create :post, private: true
      post = create :post
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = create :post
      get :show, params: { id: post.to_param }
      expect(assigns(:post)).to eq(post)
    end
  end
end
