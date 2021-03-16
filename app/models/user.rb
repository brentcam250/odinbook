class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #accepted friends
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  #not accepted yet
  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: :requester_id, dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: :requestee_id, dependent: :destroy


  #posts
  has_many :posts, dependent: :destroy
  
  #active storage
  has_one_attached :profile_photo
end
