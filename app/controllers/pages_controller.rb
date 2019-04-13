class PagesController < ApplicationController
  def index
  end

  def profile
    if current_user.nil?
      redirect_to root_url, alert: "You need to be signed in to view your profile!"
    end
  end

  def friends
    @friends = current_user.friends
  end
end
