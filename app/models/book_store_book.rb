class BookStoreBook < ApplicationRecord
  belongs_to :book
  belongs_to :book_store
end
