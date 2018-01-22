class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_films

  def create
    create_new_rating @rating
  end

  def update
    @rating = Rating.find_by id: params[:id]
    if @rating
      if @rating.update_attributes rating_params
        @ratings = @film.ratings.desc_create_time.paginate page: params[:page],
          per_page: Settings.paginate_number.per_page
        render json: {
          status: :success,
          message: t("flash.update_rate_succeed"),
          content: render_to_string(partial: "films/rating",
            locals: {ratings: @ratings}),
          avg_rate: @film.avg_rate,
          rating_id: @rating.id
        }
      else
        render json: {
          status: :error,
          message: t("flash.update_rate_succeed")
        }
      end
    else
      create_new_rating @rating
    end
  end

  def destroy
    @rating = Rating.find_by id: params[:id]
    if @rating.destroy
      @ratings = @film.ratings.desc_create_time.paginate page: params[:page],
          per_page: Settings.paginate_number.per_page
      render json: {
        status: :success,
        content: render_to_string(partial: "films/rating",
            locals: {ratings: @ratings}),
        avg_rate: @film.avg_rate
      }
    else
      render json: {
        status: :error
      }
    end
  end

  private

  def create_new_rating rating
    rating = Rating.new rating_params
    rating.user_id = current_user.id
    if rating.save
      @ratings = @film.ratings.desc_create_time.paginate page: params[:page],
        per_page: Settings.paginate_number.per_page
      render json: {
        status: :success,
        message: t("flash.create_rate_succeed"),
        content: render_to_string(partial: "films/rating",
          locals: {ratings: @ratings}),
        avg_rate: @film.avg_rate,
        rating_id: rating.id
      }
    else
      render json: {
        status: :error,
        message: t("flash.create_rate_failed")
      }
    end
  end

  def load_films
    @film = Film.find_by id: params[:rating][:film_id]
  end

  def rating_params
    params.require(:rating).permit :mark, :film_id, :review
  end
end
