require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:company) }
  it { should have_many(:posts) }
  it { should have_many(:company_investors) }
  it { should have_many(:investing_companies)
    .through(:company_investors)
    .source("company") }

  it { should have_many(:company_followers) }
  it { should have_many(:following_companies)
    .through(:company_followers)
    .source("company") }

  describe "#has_company?" do
    it "is true if user has company" do
      can = create :user, :with_company
      can_not = create :user # company_id is nil

      expect(can.has_company?).to eq true
      expect(can_not.has_company?).to be_falsy
    end
  end

  describe "#company_name" do
    it "asks company for a name" do
      cmp = create :company
      user = create :user, company: cmp

      expect(user.company_name).to eq(cmp.name)
    end
  end

  describe "#admin_of?" do
    it "returns true if user is admin" do
      cmp = create :company
      admin = create :user, company: cmp
      user = create :user

      expect(admin.admin_of?(cmp)).to be true
      expect(user.admin_of?(cmp)).to be false
    end
  end

  describe "#investor_of?" do
    it "returns true if user is investor" do
      cmp = create :company
      investor = create :user
      user = create :user

      create :company_investor, user: investor, company: cmp

      expect(investor.investor_of?(cmp)).to be true
      expect(user.investor_of?(cmp)).to be false
    end
  end
end
