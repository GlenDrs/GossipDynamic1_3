class Gossip < ApplicationRecord
    belongs_to :user
    has_many :gossip_tags
    has_many :tags through: :gossip_tags
    has_many :comments
    belongs_to :city, foreign_key: 'user_id'

    validates :title,  
    length: { minimum: 6, maximum: 30 },
    presence: true

    validates :content, presence: true

end
