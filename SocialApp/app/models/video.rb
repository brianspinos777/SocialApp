class Video < ApplicationRecord
    has_many :comments
    has_many :reactions
    belongs_to :user
    has_many :comments, as: :commentable
    has_many :reactions, as: :reactable
end
