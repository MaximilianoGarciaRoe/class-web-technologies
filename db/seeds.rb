# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Crea autores
200.times do
  Author.create(name: "Author #{rand(1..1000)}", birth: Time.now - rand(18..65).years)
end

# Crea libros
200.times do
  Book.create(title: "Book #{rand(1..1000)}", year: rand(1900..Date.today.year), author_id: rand(1..200), published_at: Time.now - rand(0..60).years)
end

# Crea tiendas de libros
200.times do
  BookStore.create(name: "Bookstore #{rand(1..1000)}", location: "Location #{rand(1..1000)}")
end

# Crea relaciones entre libros y tiendas de libros
200.times do
  BookStoreBook.create(book_id: rand(1..200), book_store_id: rand(1..200))
end