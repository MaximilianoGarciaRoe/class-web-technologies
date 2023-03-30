class CreateBookStoreBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :book_store_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :book_store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
