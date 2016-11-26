class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end
  def show
  end
  def new 
    @book =Book.new
  end
  def create
    @book =Book.new(book_params)
    
    if @book.valid?
      @book.save
      redirect_to books_path
    else
      flash[:alert]=@book.errors.full_messages
      render:new
    end
  end
  def edit
  end
  def update
    @book.update(book_params)
    redirect_to book_path
  end
  def destroy
    @book.destroy
    redirect_to books_path
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:name, :price, :publish, :publish_date)
  end
end
