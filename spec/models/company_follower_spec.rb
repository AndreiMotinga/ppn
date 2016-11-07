require 'rails_helper'

RSpec.describe CompanyFollower, type: :model do
  it { expect(create(:company_follower))
         .to validate_uniqueness_of(:company_id).scoped_to(:user_id) }
end
