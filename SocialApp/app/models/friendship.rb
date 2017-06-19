class Friendship < ApplicationRecord
    # belongs_to :user, foreign_key: "from_user_id" # the foreign key in the friendships table
    # belongs_to :friend, class_name: "User", foreign_key: "to_user_id" # the foreign key in the friendships table


    # belongs_to :from_user, class_name: "User", foreign_key: "to_user_id" # the foreign key in the friendships table
    # belongs_to :to_user, class_name: "User", foreign_key: "from_user_id" # the foreign key in the friendships table

    # belongs_to :user, foreign_key: "from_user_id" # the foreign key in the friendships table
    # belongs_to :friend, class_name: "User", foreign_key: "to_user_id" # the foreign key in the friendships table

    belongs_to :user
    belongs_to :friend, class_name: "User"


end
