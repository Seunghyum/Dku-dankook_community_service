class SchoolPhoneSearching < ActiveRecord::Base
    
    def search_school_phone
	    if campus == "죽전"
    		schools = SchoolJook.all
		elsif campus == "천안"
    		schools = SchoolChun.all
		else
            schools = []
            schools = SchoolJook.all.merge(SchoolChun.all)
		end
		
		schools = schools.where(["belong LIKE ?","%#{belong}%"]) if belong.present?
		schools = schools.where(["name LIKE ?","%#{name}%"]) if name.present?
		
        return schools
	end
end
