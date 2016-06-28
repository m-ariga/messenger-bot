class User < ActiveRecord::Base
    has_many :favorites
    validates :sender_id
end
