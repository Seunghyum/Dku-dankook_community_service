class SchoolPhoneSearching < ActiveRecord::Base
<<<<<<< HEAD
  def search_school_phone
    if campus == "죽전"
  		schools = SchoolJook.all
		elsif campus == "천안"
  		schools = SchoolChun.all
		else
  		jook = SchoolJook.all
			schools = jook.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%"])
			chun = SchoolChun.all
			schools = schools + chun.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%"])
			return schools
		end
		schools = schools.where(["belong LIKE :belong OR name Like :belong", belong: "%#{belong}%"]) if belong.present?
		# schools = schools.where(["name LIKE ?","%#{name}%"]) if name.present?

    return schools
	end
=======
  def self.search(search, campus)
    if campus =="죽전"
      result=SchoolPhoneSearching.where(campus: "죽전")
    elsif campus == "천안"
      result=SchoolPhoneSearching.where(campus: "천안")
    else
      result=where(["belong LIKE :search OR name Like :search", search: "%#{search}%"])
    end
    result = result.where(["belong LIKE :search OR name Like :search", search: "%#{search}%"]) if search.present?
    return result
  end
>>>>>>> d5ee73a... 전화번호부 2차
end
