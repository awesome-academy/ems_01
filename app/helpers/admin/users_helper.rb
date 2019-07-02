module Admin::UsersHelper
  def user_roles
    User.roles.except(:admin).map{|k, v| [t("role_#{k}"), v]}
  end
end
