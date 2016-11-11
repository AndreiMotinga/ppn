require 'rails_helper'

RSpec.describe CompanyInvestor, type: :model do
  it { expect(create(:company_investor))
         .to validate_uniqueness_of(:company_id).scoped_to(:user_id) }
end
