class BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = author.books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @author = Author.find(params[:author_id])
    @book = Book.new
  end

  def create
    author = Author.find(params[:author_id])
    @book = Book.new(book_params)
    @book.author = author
    if @book.save
      redirect_to author_path(author)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to author_book_path(@book.author, @book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to author_books_path(params[:author_id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :published_at)
  end
end
