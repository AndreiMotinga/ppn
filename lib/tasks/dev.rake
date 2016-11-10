if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      company = create :company, name: "EFC"
      create(:user,
             company_id: company.id,
             name: "Andrei",
             superadmin: true,
             email: "andrei@foo.com")

      create(:user,
             company_id: company.id,
             name: "Igor",
             superadmin: true,
             email: "igor@foo.com")

      create(:user,
             company_id: company.id,
             name: "Mike",
             superadmin: true,
             email: "mike@foo.com")

      create_list(:user, 10, :with_company)
      User.find_each { |u| create_list(:post, 20, user: u) }
      User.find_each { |u| create_list(:post, 20, user: u, private: true) }

      create_list(:company_investor, 5, company: company)

      Post.find_each do |post|
        word = post.private? ? "private" : "public"
        post.title = "#{word} - #{post.title}"
        post.created_at = (rand * 10).days.ago
        post.save
      end
    end
  end
end
