# Consultas

# Con N+1
Book.limit(10).each do |book|
  puts book.author.name
end

# Con eager loading
Book.includes(:author).first(10).each do |book|
  puts book.author.name
end

# Ejemplo exisitente en Book
Book.exist?(id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
Book.exist?(name: ['Book 1', 'Book 2', 'Book 3', 'Book 4', 'Book 5', 'Book 6', 'Book 7', 'Book 8', 'Book 9', 'Book 10'])

# Ejemplo .all.each
Book.first(4).each do |book|
  puts book.title
end

# Ejemplo .find_each
Book.find_each do |book|
  puts book.title
end

# ejemplo .find_in_batches pequeños
Book.find_in_batches(batch_size: 10) do |books|
  puts books.size
end

# ejemplo where
Book.where(id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

# ejemplo where con preload
Book.where(id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).preload(:author)

# ejemplo where con fechas
Book.where(published_at: Date.today - 1.year..Date.today)

# ejemplo where pero con string concatnedos
Book.where('published_at >= ? AND published_at <= ?', Date.today - 1.year, Date.today)

# ejemplo where con fechas y string concatenados usando hash
Book.where('published_at >= :start_date AND published_at <= :end_date', start_date: Date.today - 1.year,
                                                                        end_date: Date.today)

# ejemplo select
Book.select(:id, :title, :year)

# ejemplo select distinct
Book.select(:id, :title, :year).distinct

# ejemplo select distinct con where
Book.select(:id, :title, :year).distinct.where(id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

# ejemplo group by y agregaciones de suma
Book.select('year, SUM(id) as total').group(:year)

# otro ejemplom de group by y agregaciones de suma
Book.group(:year).sum(:id)

# ejemplo having
Book.select('year, SUM(id) as total').group(:year).having('SUM(id) > 100')

# ejemplo joins

Book.joins(:author).select('books.*, authors.name as author_name')

# otro ejemplo de joins complejos
BookStore.joins(books: :author).select('book_stores.*, books.title as book_title, authors.name as author_name')

# ejemplo fallido Pessimistic Locking
Book.transaction do
  b = Book.find(1).lock!
  b.update(title: 'New title')
end
