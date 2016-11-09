class Dashboard::InvestorsController < ApplicationController
  before_action :set_company

  def index
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
