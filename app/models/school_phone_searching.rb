class SchoolPhoneSearching < ActiveRecord::Base
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
end
