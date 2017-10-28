class PostsController < ApplicationController
  # Can only create and delete posts if logged in user
  before_action :logged_in_user, only: [:create, :destroy]
  # Can only delete posts if they belong to user
  before_action :correct_user, only: :destroy
  def create
    # Returns a new Post object associated with user
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:sucess] = "Post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def destroy
    @post.destroy
    flash[:sucess] = "Post deleted!"
    # request.referrer uses friendly forwarding to return to previous URL
    redirect_to request.referrer || root_url
  end
  private
    def post_params
      params.require(:post).permit(:content, :picture)
    end
    # Get all posts from currently logged in user
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
