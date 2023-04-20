class AddPublishedAtToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :published_at, :date
  end
end
