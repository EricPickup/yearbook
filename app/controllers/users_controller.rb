class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def new
    if !logged_in?
      redirect_to root_path, :flash => { :error => "You must be signed in to your UWindsor email to create a Yearbook profile!" }
    end
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def add
    @user_to_add = User.find(params[:id])
    if current_user
      current_user.friends << @user_to_add
    end
    redirect_to user_path(@user_to_add)
  end

  def remove
    @user_to_remove = User.find(params[:id])
    if current_user
      current_user.friends.delete(@user_to_remove)
    end
    redirect_to user_path(@user_to_remove)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :college, :relationship, :location, :major)
  end
end
