class PagesController < ApplicationController
  def index
  end

  def profile
    if current_user.nil?
      redirect_to root_url, alert: "You need to be signed in to view your profile!"
    else
      @user = current_user
      @posts = @user.posts.last(10).reverse
      @post = Post.new
    end
  end

  def friends
    @friends = current_user.friends
  end

  def find_friends
    @random_users = User.select { |user| user != current_user && (user.friends.exclude? current_user) }.sample(10)
  end

  def index
    if current_user
      @post = Post.new
      @posts = Post.select { |post| post.user == current_user || (current_user.friends.include? post.user) }.sort_by(&:created_at).reverse.first(30)
    end
  end
end
