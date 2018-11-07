class Thumbnail < ApplicationRecord
	belongs_to :artist
    attachment :image
end
