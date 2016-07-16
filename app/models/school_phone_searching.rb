class SchoolPhoneSearching < ActiveRecord::Base
  def search_school_phone
    if campus == "죽전"
  		schools = SchoolJook.all
		elsif campus == "천안"
  		schools = SchoolChun.all
		else
  		jook = SchoolJook.all
			schools = jook.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%", belong: "%#{belong}%"])
			chun = SchoolChun.all
			schools = schools + chun.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%", belong: "%#{belong}%"])
			return schools
		end
		schools = schools.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%", belong: "%#{belong}%"]) if belong.present?
		# schools = schools.where(["name LIKE ?","%#{name}%"]) if name.present?

    return schools
	end
end
