class RemoveToUserIdFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :to_user_id, :integer
  end
end
