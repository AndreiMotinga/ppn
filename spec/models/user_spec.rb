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

  describe "#admin_of?" do
    it "is true if user can administrate company" do
      company = create :company
      admin = create :user, company: company
      user = create :user

      expect(admin.admin_of?(company)).to eq true
      expect(user.admin_of?(company)).to eq false
    end
  end
end
