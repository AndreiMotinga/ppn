require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:admins) }
  it { should have_many(:posts).through(:admins) }
  it { should have_many(:company_investors) }
  it { should have_many(:investors).through(:company_investors).source(:user) }

  it { should have_many(:company_followers) }
  it { should have_many(:followers).through(:company_followers).source(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }

  describe "#public_posts" do
    it "returns company's public_posts" do
      company = create :company
      user = create :user, company: company
      create :post, private: true, user: user
      pub = create :post, private: false, user: user
      page = 1

      expect(company.public_posts(page).size).to eq 1
      expect(company.public_posts(page).first).to eq pub
    end
  end

  describe "#private_posts" do
    it "returns company's private_posts" do
      company = create :company
      user = create :user, company: company
      priv = create :post, private: true, user: user
      create :post, private: false, user: user
      page = 1

      expect(company.private_posts(page).size).to eq 1
      expect(company.private_posts(page).first).to eq priv
    end
  end
end
