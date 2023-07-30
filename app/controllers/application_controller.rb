# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_admin, unless: :devise_controller?

  private

  def check_admin
    redirect_to root_path unless current_user&.admin? || action_name == 'show'
  end
end
