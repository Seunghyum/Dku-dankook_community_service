class Locker < ActiveRecord::Base
    belongs_to :user
    belongs_to :major
end
