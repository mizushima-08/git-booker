class BooksController < ApplicationController
 def index
  @books = Book.order(id: "DESC")
  @book = Book.new
 end 
 
 def create
  @books = Book.all
  @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  flash[:notice] = "Book was successfully created." 
 end
 
 def show
  @book = Book.find(params[:id])
 end
 
 def edit
  @book = Book.find(params[:id])
 end
 
 def update
  book = Book.find(params[:id])
  book.update(book_params)
  redirect_to book_path(book)
  flash[:notice] = "Book was successfully created." 
 end
 
 def destroy
  book = Book.find(params[:id])  
  book.destroy   
  redirect_to books_path  
  flash[:notice] = "Book was successfully destroyed." 
 end
 
   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
