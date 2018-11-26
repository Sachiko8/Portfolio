class Thumbnail < ApplicationRecord
	belongs_to :artist
    attachment :image

    validates :image, presence: true
end
