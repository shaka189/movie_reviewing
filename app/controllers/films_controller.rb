class FilmsController < ApplicationController
  def show
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:danger] = t("flash.load_film") + "#{params[:id]}"
    redirect_to root_path
  end
end
