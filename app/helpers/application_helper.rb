module ApplicationHelper

  def layout_header
   current_user ? 'shared/login_header' : 'shared/logout_header'
  end
  
end
