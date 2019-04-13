class PagesController < ApplicationController
  def index
  end

  def profile
    if current_user.nil?
      redirect_to root_url, alert: "You need to be signed in to view your profile!"
    else
      @latest_posts = current_user.posts.last(10).reverse
      @post = Post.new
    end
  end

  def friends
    @friends = current_user.friends
  end

  def index
    if current_user
      @post = Post.new
      @latest_posts = Post.select { |post| post.user == current_user || (post.user.friends.include? current_user) }.last(10).reverse
    end
  end
end
