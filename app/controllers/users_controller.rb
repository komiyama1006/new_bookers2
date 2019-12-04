class UsersController < ApplicationController
before_action :authenticate_user!
 def index
 	# @user = User.new
 	@book = Book.new
 	@users = User.all
 	@books = Book.all
 end

 def show
 	@user = User.find(params[:id])
 	@book = Book.new
 	@books = Book.all
 end

 def edit
 	@user = User.find(params[:id])
 	if current_user.id != @user.id
 		redirect_to user_path(current_user.id)
 	end
 end
 
 # def update
 # 	@user = User.new(user_params)
 #    @user.user_id = current_user.id
 #    @user.update
 #    redirect_to user_path
 # end

 # 2019.11.25 追加
 def update
 	@user = User.find(params[:id])
 	if @user.update(user_params)
 		flash[:success] = "You have updated user successfully."
 	 redirect_to user_path(@user.id)

 	else

 		render :edit
 	end

 end

 def create
 	# user = User.new(user_params)
 	# redirect_to'/users/index'
 	@book = Book.new(book_params)
 	book.save
 	redirect_to users_path
 end

 def new
 	@book = Book.new
 end

 private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def book_params
    	params.require(:book).permit(:title, :body)
    end

end
