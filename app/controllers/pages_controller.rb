class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @book = Book.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def about
    @title = "About"
  end

end
