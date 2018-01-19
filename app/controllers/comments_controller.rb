class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post_review

  def create
    @comment = @post_review.comments.build comment_params
    @comment.user = current_user
    if @comment.save
      @comments = @post_review.comments.desc_create_at.paginate page: params[:page],
        per_page: Settings.paginate_number.per_page
      render json: {
        status: :success,
        content: render_to_string(partial: "comment/comment",
          locals: {comments: @comments})
      }
    else
      render json: {
        status: :error
      }
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      @comments = @post_review.comments.desc_create_at.paginate page: params[:page],
        per_page: Settings.paginate_number.per_page
      render json: {
        status: :success,
        content: render_to_string(partial: "comment/comment",
          locals: {comments: @comments})
      }
    else
      render json: {
        status: :error
      }
    end
  end

  private

  def comment_params
    params.require(:comments).permit(:content, :post_review_id)
  end

  def load_post_review
    @post_review = PostReview.find_by id: params[:post_review_id]
  end
end
