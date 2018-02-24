class Api::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments, status: 200
  end

  def show
    render json: @comment, status: 200
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: 201
    else
      render json: {message: comment.errors}, status: 422
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
