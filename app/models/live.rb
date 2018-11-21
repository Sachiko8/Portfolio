class Live < ApplicationRecord

	belongs_to :artist
	belongs_to :place
	has_many :comments, dependent: :destroy

end
