class BookList < ActiveRecord::Base
  has_many :books
  def self.search(search)
    if search
      where(["name LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end
end
