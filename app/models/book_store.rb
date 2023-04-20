class BookStore < ApplicationRecord
  has_many :book_store_books
  has_many :books, through: :book_store_books

  validates :name, presence: true
  validates :location, presence: true

  # validate :location_is_valid

  scope :in_city, ->(city) { where('location ILIKE ?', "%#{city}%") }

  private

  def location_is_valid
    return unless location && !location.match?(/\A[A-Za-z\s]+\z/)

    errors.add(:location, 'should only contain letters and spaces')
  end
end
