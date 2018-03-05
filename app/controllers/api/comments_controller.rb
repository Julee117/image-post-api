class Api::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_post, only: [:index, :create]

  def index
    @comments = Comment.all
    render json: @comments, status: 200
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: 201
    else
      render json: {message: comment.errors}, status: 422
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: {message: @comment.errors}, status: 422
    end
  end

  def destroy
    if @comment.destroy
      render status: 204
    else
      render json: {message: "Unable to remove comment"}, status: 400
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
