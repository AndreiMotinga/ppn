require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:admins) }
end