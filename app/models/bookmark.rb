class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :song
  
  scope :bookmarking, -> {where(user_id: current_user.id)}
end
