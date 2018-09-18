class ApplicationController < ActionController::Base
  include KaminariHelper
  layout :load_layout_devise
  protect_from_forgery with: :exception
  before_action :load_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found?
  rescue_from CanCan::AccessDenied, with: :access_denied!

  def load_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def not_found?
    render file: "#{Rails.root}/public/404.html", status: 403, layout: false
  end

  private

  def load_layout_devise
    "users" if devise_controller?
  end

  def after_sign_in_path_for resource
    resource.admin? ? admin_root_path : root_path
  end

  def access_denied!
    respond_to do |format|
      format.html do
        redirect_to root_path, flash: {danger: t("not_authorized")}
      end
      format.json do
        render json: {message: t("not_authorized"), type: Settings.error}
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: User::USER_PARAMS)
    devise_parameter_sanitizer.permit(:account_update, keys: User::USER_PARAMS)
  end

  def logged_in_user
    return if user_signed_in?
    flash[:danger] = t "notice.require_login"
    redirect_to new_user_session_path
  end
end
