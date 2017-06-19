class AddInitiatorToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :initiator, :string
  end
end
