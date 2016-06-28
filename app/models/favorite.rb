class Favorite < ActiveRecord::Base
    belongs_to :user
  validates :user_id, presence: true
  validates :music, presence: true
  validates :artist, presence:true
end
