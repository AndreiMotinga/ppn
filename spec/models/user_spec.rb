require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:company) }

  describe "#can_write?" do
    it "is true if user has company" do
      can = create :user, :with_company
      can_not = create :user # company_id is nil

      expect(can.can_write?).to eq true
      expect(can_not.can_write?).to be_falsy
    end
  end
end
