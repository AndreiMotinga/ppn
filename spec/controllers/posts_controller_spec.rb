require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_session) { {} }
  let(:valid_attributes) { attributes_for(:post) }
  let(:invalid_attributes) { {title: ""} }

  describe "GET #index" do
    it "assigns only public posts as @posts" do
      create :post, private: true
      post = create :post
      get :index, params: {}, session: valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = create :post
      get :show, params: {id: post.to_param}, session: valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    context "user is authorized" do
      it "assigns a new post as @post" do
        sign_in create(:user, :with_company)
        get :new, params: {}, session: valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
    context "user is logged in but not authorized" do
      it "redirects_to root_path" do
        sign_in(create(:user))
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
    context "user isn't logged in" do
      it "redirects_to root_path" do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #edit" do
    context  "user is authorized" do
      it "assigns the requested post as @post" do
        user = create(:user, :with_company)
        sign_in user
        post = create :post, user: user
        get :edit, params: {id: post.to_param}
        expect(assigns(:post)).to eq(post)
      end
    end

    context "user is logged in but not authorized" do
      it "redirects to root_path" do
        user = create(:user)
        sign_in(user)
        post = create :post
        get :edit, params: {id: post.to_param}
        expect(response).to redirect_to(root_path)
      end
    end

    context "user isn't logged in" do
      it "redirects_to root_path" do
        post = create :post
        get :edit, params: {id: post.to_param}
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    before do
      @user = create(:user, :with_company)
      sign_in @user
    end

    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "creates a new Post" do
        post :create, params: { post: valid_attributes }
        expect(Post.last.user).to eq @user
      end

      it "assigns a newly created post as @post" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before do
      @user = create(:user, :with_company)
      sign_in @user
    end

    context "with valid params" do
      let(:new_attributes) { attributes_for :post }
      it "updates the requested post" do
        post = create :post, user: @user
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload

        expect(post.title).to eq new_attributes[:title]
        expect(post.text).to eq new_attributes[:text]
      end

      it "assigns the requested post as @post" do
        post = create :post, user: @user
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = create :post, user: @user
        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = create :post, user: @user
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = create :post, user: @user
        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = create(:user, :with_company)
      sign_in @user
    end

    it "destroys the requested post" do
      post = create :post, user: @user
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create :post, user: @user
      delete :destroy, params: {id: post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end
end
