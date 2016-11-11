class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :public, :private]

  def show
  end

  def public
  end

  def private
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
