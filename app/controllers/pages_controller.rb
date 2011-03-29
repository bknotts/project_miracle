class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end
  
  def sign_up
    @title = "Sign Up"
  end

end
