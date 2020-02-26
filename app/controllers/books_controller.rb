class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top]
before_action :correct_book, only: [:edit]

	def top
	end


    def index
      @user = current_user
    	@book = Book.new
    	@books = Book.all
    end
	def create
    	@book = Book.new(book_params)
    	@book.user_id = current_user.id
  		if @book.save
        flash[:notice] = 'You have created book successfully.'
    	redirect_to book_path(@book.id)
    else
      @books = Book.all
      render action: :index
    end
	end
  	def show
    	@book = Book.find(params[:id])
      @book1 = Book.new
      @user = Book.find(params[:id]).user
  	end
  	def edit
   	 	@book = Book.find(params[:id])
  	end
  	def update
     	@book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
    	redirect_to book_path(@book)
    else
      render action: :edit
    end
  	end
  	def destroy
    	@book = Book.find(params[:id])
    	@book.destroy
    	redirect_to books_path
  end
    private
    def book_params
    	params.require(:book).permit(:title, :body)
  	end
    def correct_book
      @book = Book.find(params[:id])
     if current_user.id != @book.user.id
       redirect_to books_path
     end
    end

end
