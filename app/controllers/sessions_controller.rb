class SessionsController < ApplicationController
  NUMBER_OF_INITIAL_RANDOM_FRIENDS_PER_USER = 15

  def create
    user = User.find_or_create_by(:email => auth_hash[:info][:email]) do |user|
      user.email = auth_hash[:info][:email]
      user.name = auth_hash[:info][:name]
      (User.first.id..User.last.id).to_a.sample(NUMBER_OF_INITIAL_RANDOM_FRIENDS_PER_USER).each do |random_user_id|
        random_user = User.find(random_user_id)
        next if random_user_id == user.id || (user.friends.include? random_user)
        user.friends << random_user
      end
    end

     session[:user_id] = user.id

     redirect_to root_path, :flash => { :success => "You've successfully signed in as #{user.name}!" }
  end

   def destroy
    reset_session

     redirect_to root_path
  end

   private

   def auth_hash
    request.env["omniauth.auth"]
  end
end
