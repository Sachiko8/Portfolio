class Live < ApplicationRecord
	belongs_to :artist
	belongs_to :place
	has_many :posts, dependent: :destroy

end
