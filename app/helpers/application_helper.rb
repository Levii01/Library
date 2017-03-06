module ApplicationHelper
  def which_alert(type)
    type.to_s == 'notice' ? 'success' : 'danger'
  end
end
