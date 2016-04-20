class Major < ActiveRecord::Base
 	has_many :users	
 	
  def self.get_users_of_same_school(school_id)
    School.find(school_id).users
  end
  require 'csv'
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      school_hash = row.to_hash
      school = School.where(id: school_hash["id"])

      if school.count == 1
        school.first.update_attributes(school_hash)
      else
        School.create!(school_hash)
      end
    end
  end
end
