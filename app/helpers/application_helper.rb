module ApplicationHelper
  def user_admin?
    current_user && current_user.admin?
  end
end
