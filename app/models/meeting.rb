class Meeting < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
end
