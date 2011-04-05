class BooksController < ApplicationController
  before_filter :authenticate
  
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
  end
end