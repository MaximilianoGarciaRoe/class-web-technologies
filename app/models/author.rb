class Author < ApplicationRecord
	has_many :books

	before_save :capitalize_name

  after_create :send_welcome_email

  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end

  def send_welcome_email
  	AuthorMailer.welcome_email(self).deliver_now
  end
end
