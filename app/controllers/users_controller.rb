class UsersController < ApplicationController

	before_action :authenticate_user!

	def new
		@user = User.new
	end

  def index
  		@user = current_user
    	@users = User.all
    	@book =Book.new
  end
  def create
  	    @user = User.new(book_params)
    	@book.user_id = current_user.id
  		@user.save!
    	redirect_to user_path(@user.id)
  end
  def show
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  	@book = Book.new

  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    	if @user.update(user_params)
    		flash[:notice] = 'You have updated user successfully.'
    		redirect_to user_path(@user.id)
    	else
    		render action: :edit
		end
	end
	private
	def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
