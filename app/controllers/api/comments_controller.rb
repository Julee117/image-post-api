class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments, status: 200
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
