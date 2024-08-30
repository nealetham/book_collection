class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to(@book, notice: "Book successfully created.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to(@book, notice: "Book successfully updated.")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to(books_path, status: :see_other, notice: "Book successfully deleted.")
  end

  private
    def book_params
      params.require(:book).permit(:title)
    end
end
