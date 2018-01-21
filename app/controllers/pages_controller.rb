class PagesController < ApplicationController
  def home
    @movie_title = ScrapingImdb.new.title
    @posts = PostReview.approved.newest.paginate(page: params[:page]).limit(12).to_a
    @hot_posts = PostReview.find Like.hot_posts.map(&:post_review_id)
    @films = Film.desc_create_time.limit(3).to_a
  end

  def about
  end

  def help
  end
end
