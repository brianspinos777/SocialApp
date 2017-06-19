class HomeController < ApplicationController
  def index

    @user = current_user

    @friends = Friendship.where(user_id: current_user.id, accepted: true, pending: false).all

    @friend_requests = Friendship.where(user_id: current_user.id, accepted: false, pending: true, initiator: 'f').all

    @my_friend_requests = Friendship.where(user_id: current_user.id, accepted: false, pending: true, initiator: 'u').all

    #
    # Notice that we are using `friendships.id AS friendship_id`
    # because the `id` column is ambiguous between the two tables: `users` and `friendships`
    #
    @users = User
    .select("users.*, friendships.id AS friendship_id, friendships.user_id, friendships.friend_id, friendships.accepted, friendships.pending, friendships.initiator")
    .joins("LEFT OUTER JOIN friendships ON users.id = friendships.friend_id AND  friendships.user_id = #{current_user.id} ")
    .where("users.id != #{current_user.id}")
    .all


  end
end
