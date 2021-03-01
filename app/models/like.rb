class Like < ApplicationRecord
    belongs_to :user #liker

    belongs_to :likeable, polymorphic: true
end
