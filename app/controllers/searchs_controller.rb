class SearchsController < ApplicationController
  def index
    content = params[:content]
    if content.present?
      option = params[:search_option]
      case option
      when "all"
        @search_films = Film.search_film(content)
        @search_categories = Category.search_categories(content)
        @search_posts = PostReview.search_post(content)
        return if @search_films.present? || @search_categories.present? || @search_posts.present?
        flash.now[:danger] = t "flash.search_failed"
      when "name"
        @search_films = Film.search_film(content)
        return if @search_films.present?
        flash.now[:danger] = t "flash.search_failed"
      when "category"
        @search_categories = Category.search_categories(content)
        return if @search_categories.present?
        flash.now[:danger] = t "flash.search_failed"
      when "post"
        @search_posts = PostReview.search_post(content)
        return if @search_posts.present?
        flash.now[:danger] = t "flash.search_failed"
      else
        flash.now[:danger] = t "flash.search_failed"
      end
    else
      flash.now[:danger] = t "flash.search_failed"
    end
  end

  private

  def search_params
    params.require(:search).permit :content, :search_option
  end
end
