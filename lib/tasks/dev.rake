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
      User.find_each { |u| create_list(:post, 10, user: u) }

      company = create :company, name: "EFC"
      katie = create :user, name: "Katie", company_id: company.id
      create_list(:post, 30, user: katie, title: "Private Post title", private: true)
      create_list(:post, 40, user: katie, title: "Public Post title", private: false)
      create_list(:company_investor, 5, company: company)
      create_list(:company_follower, 40, company: company)
    end
  end
end
