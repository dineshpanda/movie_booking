module ApplicationHelper

  def layout_header
   current_user ? 'shared/login_header' : 'shared/logout_header'
  end

  def flash_type(type)
    case type
    when "success"
      "success"
    when "alert"
      "warning"
    else
      "info"
    end
  end
  
end
