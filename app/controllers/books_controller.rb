
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @books = Book.new
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if (@book.update(book_params))
      redirect_to @book
    else
      render 'books/edit'
    end
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy

    redirect_to books_path
  end

  def create
    # render plain: params[:post].inspect
    @book = Book.new(book_params)

    if (@book.save)
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private def book_params
    params.require(:book).permit(:name, :description)
  end
end
