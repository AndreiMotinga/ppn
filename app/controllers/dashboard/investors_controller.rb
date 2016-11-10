class Dashboard::InvestorsController < Dashboard::BaseController
  def index
    @investors = current_user.company.investors.page(params[:page])
  end

  def search
    @user = User.find_by_email(params[:email])
  end
end
