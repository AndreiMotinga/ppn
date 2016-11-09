if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      company = create :company, name: "EFC"
      andrei = create(:user,
                      company_id: company.id,
                      name: "Andrei",
                      admin: true,
                      email: "andrei@foo.com")

      create(:user,
             company_id: company.id,
             name: "Igor",
             admin: true,
             email: "igor@foo.com")

      create(:user,
             company_id: company.id,
             name: "Mike",
             admin: true,
             email: "mike@foo.com")

      User.find_each { |u| create_list(:post, 15, user: u) }
      User.find_each { |u| create_list(:post, 15, user: u, private: true) }

      create_list(:company_investor, 5, company: company)
      # create_list(:company_follower, 40, company: company)

      create_list(:user, 10, :with_company)
    end
  end
end
