module ApplicationHelper
  def bootstrap_class_for flash_type
    {success: 'alert-success', error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type.to_sym] || flash_type.to_s
  end

  def all_t_format(date)
    date.strftime("%Y.%m.%d %H:%M")
  end
end
