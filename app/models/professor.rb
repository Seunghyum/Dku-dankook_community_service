class Professor < ActiveRecord::Base
  has_many :lecture_infos
  belongs_to :user
  acts_as_votable

  def self.search(search)
    if search
      find_by(["name LIKE :search", search: "%#{search}%"]).lecture_infos
    else
      all
    end
  end

  def self.search_professor(search)
    if search
      find_by(["name LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end
end
