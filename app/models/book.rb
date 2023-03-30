class Book < ApplicationRecord
  belongs_to :author
  has_many :book_store_books
  has_many :book_stores, through: :book_store_books

  validates :title, presence: true

  validate :title_is_not_author

  private

  def title_is_not_author
    if title && author && title.downcase == author.name.downcase
      errors.add(:title, "can't be the same as the author")
    end
  end
end
