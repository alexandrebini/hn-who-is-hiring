class Api::PostsController < Api::BaseController
  def index
    @posts = Post.recent
    render json: @posts
  end
end