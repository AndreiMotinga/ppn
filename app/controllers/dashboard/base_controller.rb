class Dashboard::BaseController < ApplicationController
  before_action :validate_user

  private

  def validate_user
    redirect_to root_path unless current_user.try(:can_write?)
  end
end
