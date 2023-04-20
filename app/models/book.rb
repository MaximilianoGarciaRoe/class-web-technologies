class Book < ApplicationRecord
  belongs_to :author
  has_many :book_store_books
  has_many :book_stores, through: :book_store_books

  validates :title, presence: true

  validate :title_is_not_author

  # scope :with_book_store, -> { includes(:book_stores) }

  # scope :with_book_store_and_ordered_by_name, -> { with_book_store.joins(:author).merge(Author.ordered_by_name) }

  scope :published_between, ->(start_date, end_date) { where(published_at: start_date..end_date) }
  scope :published_books, -> { published_between(Time.now - 1.year, Time.now) }

  private

  def title_is_not_author
    return unless title && author && title.downcase == author.name.downcase

    errors.add(:title, "can't be the same as the author")
  end
end
