class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image_url, :content)
  end
end
