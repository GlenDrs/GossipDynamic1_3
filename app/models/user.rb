class User < ApplicationRecord
    belongs_to :city
    has_many :user_private_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
    has_many :sent_messages, foreign_key: 'recipient_id', class_name: 'UserPrivateMessage'
    has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage', through: :user_private_messages
    has_many :gossips
    has_many :comments

    validates :first_name,  
    presence: true

    validates :last_name,  
    presence: true
end
