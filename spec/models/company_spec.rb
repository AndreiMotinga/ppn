require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:admins) }
  it { should have_many(:posts).through(:admins) }
  it { should have_many(:company_investors) }
  it { should have_many(:investors).through(:company_investors).source(:user) }

  it { should have_many(:company_followers) }
  it { should have_many(:followers).through(:company_followers).source(:user) }
end
