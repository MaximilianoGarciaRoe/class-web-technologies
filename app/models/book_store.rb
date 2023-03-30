class BookStore < ApplicationRecord
  has_many :book_store_books
  has_many :books, through: :book_store_books

  # validates :name, presence: true
  # validates :location, presence: true

  # validate :location_is_valid

  # private

  # def location_is_valid
  #     if location && !location.match?(/\A[A-Za-z\s]+\z/)
  #     errors.add(:location, "should only contain letters and spaces")
  #     end
  # end
end
