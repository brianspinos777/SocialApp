class RemoveFromUserIdFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :from_user_id, :integer
  end
end
