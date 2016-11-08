if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create(:user, name: "Igor", admin: true)
      create(:user, name: "Mike", admin: true)
      create(:user, name: "Andrei", admin: true)
      create_list(:user, 20, :with_company)
      User.all { |u| create_list(:post, 10, user: u) }

      katie = create :user, :with_company, name: "Katie"
      create_list(:post, 30, user: katie)
      create_list(:company_investor, 5, company: katie.company)
      create_list(:company_follower, 40, company: katie.company)
    end
  end
end
