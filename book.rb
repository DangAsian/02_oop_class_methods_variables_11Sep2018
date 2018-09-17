class Book

  @@on_shelf = [] #contain collection of book objects that are available to be rented
  @@on_loan = [] #contain collection of books that are currently being borrowed

#Initialize instance
def initialize(title, author, isbn)
  @title = title
  @author = author
  @isbn = isbn
end

#Create a new Book
def self.create(title, author, isbn)
  new_book = Book.new(title, author, isbn)
  @@on_shelf << new_book
  return new_book
end

#Return what books are on shelf
def self.available
  return @@on_shelf
end
#Return what books are loaned out
def self.borrowed
  return @@on_loan
end

#Checking if the book is lent out
def lent_out?
  if @@on_loan.include?(self)
    return true
  else
    return false
  end
end

#Returns randomized book within array
def self.browse
  return @@on_shelf.sample
end

#return the due date for books taken out today
def self.current_due_date
  due_date = (Time.now + (60*60*6000))
end
#   if @@on_loan.include?(book)
#     return Time.now + 60
#   else
#     return self.borrowed.inspect
#   end
# end

def borrow
  if lent_out?
    return false
  else
    self.due_date = Book.current_due_date
    @@on_shelf.delete(self)
    @@on_loan.push(self)
    return true
  end

end

def instance_to_library
end




def self.overdue_books
end



  def due_date
    return @due_date
  end

  def due_date=(date)
    @due_date = date
  end
end

wheres_waldo = Book.create("waldo", "dan", 12421)
lotr = Book.create("The Fellowship", "JR", 2222)
# p wheres_waldo
# p lotr
#
# p wheres_waldo.lent_out?


wheres_waldo.borrow

puts Book.current_due_date

puts Book.borrowed.inspect
puts ("-----")
puts Book.available.inspect
