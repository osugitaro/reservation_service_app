class ApplicationController < ActionController::Base

  before_action :set_search
  before_action :configure_account_update_parameters, if: :devise_controller?

  def set_search
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :image, :name, :introduction])
  end


end
