class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :family_name, :first_name, :nick_name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def user_signed_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def group_belongs_check
    group = GroupUser.where(user_id: current_user.id)
    if group.blank?
      redirect_to new_group_path
    end
  end

end
