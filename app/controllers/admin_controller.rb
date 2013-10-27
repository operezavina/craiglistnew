class AdminController < ApplicationController
  before_action :admin_user,     only: :dashboard
  def dashboard

  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end