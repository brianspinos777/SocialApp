class AddPendingToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :pending, :boolean
  end
end
