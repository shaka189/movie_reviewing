class SearchsController < ApplicationController
  def index
    @posts = PostReview.approved.ransack(title_cont: params[:q]).result(distinct: true)
    @films = Film.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @films = @films.limit(4)
        @posts = @posts.limit(4)
      }
    end
  end
end
