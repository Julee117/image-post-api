class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  def show
    render json: @post, status: 200
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: 201
    else
      render json: {message: post.errors}, status: 422
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, status: 200
    else
      render json: {message: @post.errors}, status: 422
    end
  end

  def destroy
    if @post.destroy
      render status: 204
    else
      render json: {message: "Unable to remove post"}, status: 400
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image_url, :content, :likes)
  end
end
