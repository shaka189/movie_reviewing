class SearchsController < ApplicationController
 def index
  end

    def search
        @posts = PostReview.ransack(title_cont: params[:q]).result(distinct: true)
        @films = Film.ransack(name_cont: params[:q]).result(distinct: true)

        respond_to do |format|
          format.html {}
          format.json {
            @films = @films.limit(3)
            @posts = @posts.limit(3)
          }
        end
end
end
