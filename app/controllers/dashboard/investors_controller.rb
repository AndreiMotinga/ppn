class Dashboard::InvestorsController < Dashboard::BaseController
  def index
    @investors = current_user.company.investors.page(params[:page])
  end
end
