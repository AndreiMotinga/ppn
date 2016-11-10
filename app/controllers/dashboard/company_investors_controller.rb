class Dashboard::CompanyInvestorsController < Dashboard::BaseController
  def create
    @investor = CompanyInvestor.new(company_investor_params)

    if @investor.save
      redirect_to dashboard_investors_path,
                  notice: "Investor was successfully added."
    end
  end

  private

  def company_investor_params
    params.require(:company_investor).permit(:company_id, :user_id)
  end
end
