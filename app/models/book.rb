class Book < ActiveRecord::Base
  belongs_to :book_list

  before_update :destroy_book_list
  after_update :create_book_list, :update_purchase

  after_create :create_book_list
  before_destroy :destroy_book_list

  def create_book_list
    summury_name = self.name.gsub(/\s+/, "")
    list = BookList.find_by(name: summury_name)
    if list.nil?
      new_book_list = BookList.create(name: self.name, num_of_book: 1)
      self.update_column(:book_list_id, new_book_list.id)
    else
      self.update_column(:book_list_id, list.id)
      self.book_list.increment!(:num_of_book, 1)
    end
  end

  def destroy_book_list
    list = self.book_list
    list.decrement!(:num_of_book, 1)
    if list.num_of_book == 0
      list.delete
    end
  end

  def update_purchase
    counting = self.book_list.books.where(purchase: true).count
    self.book_list.update_column(:num_of_purchase, counting)
  end
end
