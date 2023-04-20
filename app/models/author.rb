class Author < ApplicationRecord
  has_many :books

  before_save :capitalize_name

  after_create :send_welcome_email

  scope :ordered_by_name, -> { order(name: :asc) }
  scope :books_name_start_with, ->(letter) { joins(:books).where('books.title ILIKE ?', "#{letter}%") }
  scope :super_scope, ->(letter) { ordered_by_name.books_name_start_with(letter) }

  def downcase_name
    name.downcase
  end

  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end

  def send_welcome_email
    # AuthorMailer.welcome_email(self).deliver_now
  end
end
