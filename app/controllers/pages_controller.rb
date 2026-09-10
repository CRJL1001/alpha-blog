class PagesController < ApplicationController

  def home
    redirect_to articles_path if !logged_out?
  end

  def about
  end
  
end
