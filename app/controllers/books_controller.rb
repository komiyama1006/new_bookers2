class BooksController < ApplicationController
before_action :authenticate_user!
	def index
 	# @user = User.new
 	@book = Book.new
 	@users = User.all
 	@books = Book.all
 	end

	def create
		@book = Book.new(books_params)
		@book.user_id = current_user.id
		#binding.pry
		if @book.save
			flash[:success] = "You have creatad book successfully."
			redirect_to book_path(@book.id)
		else
			@users = User.all
 			@books = Book.all
			render :index
		end
	end
	
	# createで作成した情報を取り出したい
	def show
		@books = Book.new
		@book = Book.find(params[:id])
	end
	
	def update
	# 下記は更新したユーザー情報を保管する
 	# @user = User.find(params[:id])
 	# @user.update(user_params)
 	
 	# 下記は更新した本の情報を保管する
	 	@books = Book.find(params[:id])
	 	if @books.update(books_params)
	 	# 下記は必要であれば記載する
	 		flash[:success] = "You have updated book successfully."
	 		redirect_to book_path(@books.id)
	 	else
	 		render :edit
	 	end
	end

	def new
 	@book = Book.new
 	end

 	def edit

 	@books = Book.find(params[:id])
 	if @books.user.id != current_user.id
 		redirect_to books_path
 	end

 	end

 	def destroy
 		@book = Book.find(params[:id])
 		@book.destroy
 		redirect_to books_path
 	end


	private
	def books_params
	params.require(:book).permit(:title,:body)
	end
end
