class BooksController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @book = current_user.books.build(params[:book])
    if @book.save
      flash[:success] = "Book created"
      redirect_to root_path
    else
      @feed_items = [ ]
      render 'pages/home'
    end
  end
  
  def destroy
    @book.destroy
    redirect_back_or root_path
  end
  
  private
  
    def authorized_user
      @book = Book.find(params[:id])
      redirect_to root_path unless current_user?(@book.user)
    end
end