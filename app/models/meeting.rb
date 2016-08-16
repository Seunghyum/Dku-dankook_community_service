class Meeting < ActiveRecord::Base
  mount_uploader :photo, ImageUploader

  after_save :check_type_class

  def check_type_class
    if self.event_type == "학사"
      self.update_column(:type_class, "primary")
    elsif self.event_type == "동아리"
      self.update_column(:type_class, "success")
    elsif self.event_type == "총학"
      self.update_column(:type_class, "info")
    elsif self.event_type == "강연"
      self.update_column(:type_class, "warning")
    elsif self.event_type == "기타"
      self.update_column(:type_class, "danger")
    end
  end
end
