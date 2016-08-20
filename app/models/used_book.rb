class UsedBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :major
  def self.search(search)
    if search
      where(["btitle LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end
end
