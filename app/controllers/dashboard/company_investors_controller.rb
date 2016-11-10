class Dashboard::CompanyInvestorsController < Dashboard::BaseController
  def create
    user = User.find_by_email(params[:email])
    if user
      @investor = CompanyInvestor.new(
        company_id: current_user.company.id,
        user_id: user.id
      )
      if @investor.save
        redirect_to dashboard_investors_path,
                    notice: "Investor was successfully added."
      end
    else
      redirect_to dashboard_investors_path,
                  notice: "Couldn't find user with email #{params[:email]}"
    end
  end

  def destroy
    CompanyInvestor.where(
      company_id: current_user.company.id,
      user_id: params[:id]
    ).first.destroy
    redirect_to dashboard_investors_path,
                notice: "Investor was successfully removed."
  end

  private

  def company_investor_params
    params.require(:company_investor).permit(:company_id, :user_id)
  end
end
