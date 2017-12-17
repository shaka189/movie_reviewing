class PagesController < ApplicationController
  def home
    @movie_title = ScrapingImdb.new.title
  end

  def about
  end

  def help
  end
end
