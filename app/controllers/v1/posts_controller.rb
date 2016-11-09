class V1::PostsController < V1::ApplicationController
  before_action :authenticate_api_user!

  def index
    @posts = Post.all
    render json: {
               posts: @posts
           }
  end

end