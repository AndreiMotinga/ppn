require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:admins) }
  it { should have_many(:company_investors) }
end
