class Artist < ApplicationRecord
	# has_many :lives, dependent: :destroy
	# has_many :movies, dependent: :destroy
	# belongs_to :favorite
	has_many :thumbnails, dependent: :destroy
  	accepts_attachments_for :thumbnails, attachment: :image

	# attachment :artist_image
end
