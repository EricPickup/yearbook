class User < ApplicationRecord
  has_and_belongs_to_many :friends,
    class_name: "User",
    join_table: :friends_users,
    foreign_key: :user_id,
    association_foreign_key: :friend_id
  has_many :posts
end
