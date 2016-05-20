class Major < ActiveRecord::Base
    belongs_to :user
    has_one :locker
end
