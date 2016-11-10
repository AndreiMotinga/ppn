require "rails_helper"

RSpec.describe CompaniesController, type: :controller do
  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested company as @company" do
      company = create :company

      get :show, params: { id: company.to_param }, session: valid_session

      expect(assigns(:company)).to eq(company)
    end
  end
end
