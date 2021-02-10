class Friendship < ApplicationRecord
    #go between table to track user to user relations (aka friendships)
    belongs_to :user
    belongs_to :friend, class_name: "User" 
end