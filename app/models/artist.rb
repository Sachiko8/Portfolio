class Artist < ApplicationRecord


	has_many :lives, dependent: :destroy
	# has_many :movies, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :thumbnails, dependent: :destroy
  	accepts_attachments_for :thumbnails, attachment: :image

    def favorite_user(id)
    favorites.find_by(user_id: id)
  end

end
