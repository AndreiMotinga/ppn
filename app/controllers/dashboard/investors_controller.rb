class Dashboard::InvestorsController < Dashboard::BaseController
  def index
    @investors = current_user.company.investors
      .order("company_investors.created_at desc")
      .page(params[:page])
  end
end
