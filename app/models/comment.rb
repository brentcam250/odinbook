class Comment < ApplicationRecord
    belongs_to :user #author
    belongs_to :commentable, polymorphic: true 
end
