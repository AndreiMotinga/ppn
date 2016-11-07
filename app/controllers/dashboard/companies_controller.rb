class Dashboard::CompaniesController < Dashboard::BaseController
  before_action :set_company

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to edit_dashboard_company_path(@company),
                  notice: "Company was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_company
    @company = current_user.company
  end

  def company_params
    params.require(:company).permit(:name, :description, :address, :phone,
                                    :email, :logo)
  end
end
