require "rails_helper"

RSpec.describe Dashboard::CompaniesController, type: :controller do
  let(:valid_attributes) { attributes_for :company }
  let(:invalid_attributes) { { name: "" } }
  let(:valid_session) { {} }

  describe "GET #edit" do
    it "assigns the requested company as @company" do
      user = create :user, :with_company
      sign_in user

      get :edit, params: { id: user.company.id }

      expect(assigns(:company)).to eq(user.company)
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for :company }

      it "updates the requested company" do
        company = create :company
        user = create :user, company: company
        sign_in user

        put :update, params: { id: user.company.id, company: new_attributes }
        company.reload

        expect(company.name).to eq new_attributes[:name]
        expect(company.description).to eq new_attributes[:description]
        expect(company.phone).to eq new_attributes[:phone]
        expect(company.address).to eq new_attributes[:address]
        expect(company.email).to eq new_attributes[:email]
      end

      it "assigns the requested company as @company" do
        company = create :company
        user = create :user, company: company
        sign_in user

        put :update, params: { id: company.to_param, company: valid_attributes }

        expect(assigns(:company)).to eq(company)
      end

      it "redirects to edit company page" do
        company = create :company
        user = create :user, company: company
        sign_in user

        put :update, params: { id: company.to_param, company: valid_attributes }

        expect(response).to redirect_to(edit_dashboard_company_path(company))
        expect(flash[:notice]).to eq "Company was successfully updated."
      end
    end

    context "with invalid params" do
      it "assigns the company as @company" do
        company = create :company
        user = create :user, company: company
        sign_in user

        put :update, params: { id: company.to_param,
                               company: invalid_attributes }

        expect(assigns(:company)).to eq(company)
      end

      it "re-renders the 'edit' template" do
        company = create :company
        user = create :user, company: company
        sign_in user

        put :update, params: { id: company.to_param,
                               company: invalid_attributes }

        expect(response).to render_template("edit")
      end
    end
  end
end
