class Dashboard::BaseController < ApplicationController
  before_action :validate_user

  private

  def validate_user
    redirect_to root_path unless current_user.try(:has_company?)
  end
end
