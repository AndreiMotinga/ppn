require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:summary) }

  describe ".public_posts" do
    it "only returns public posts" do
      create :post, private: true
      pub = create :post, private: false

      result = Post.public_posts
      expect(result.count).to eq 1
      expect(result.first).to eq pub
    end
  end

  describe ".private_posts" do
    it "only returns private posts" do
      prvt = create :post, private: true
      create :post, private: false

      result = Post.private_posts
      expect(result.count).to eq 1
      expect(result.first).to eq prvt
    end
  end

  describe ".desc" do
    it "return posts by newest" do
      new = create :post, created_at: Date.today
      old = create :post, created_at: 2.days.ago
      future = create :post, created_at: 1.day.from_now

      result = Post.desc.map(&:created_at)
      expected = [future, new, old].map(&:created_at)

      expect(result).to eq expected
    end
  end

  describe ".by_admins" do
    it "returns posts by admins" do
      create_list(:post, 5)
      admin1 = create :user, :with_company
      admin2 = create :user, :with_company
      post1 = create :post, user: admin1
      post2 = create :post, user: admin2
      ids = [admin1, admin2].pluck(:id)

      expect(Post.by_admins(ids)).to match_array [post1, post2]
    end
  end
end
