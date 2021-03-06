class PostsController < ApplicationController
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referrer, :flash => { :info => "Deleted post" }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to request.referrer
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
