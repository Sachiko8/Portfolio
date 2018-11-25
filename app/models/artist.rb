class Artist < ApplicationRecord

	has_many :lives, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :thumbnails, dependent: :destroy
  	accepts_attachments_for :thumbnails, attachment: :image

    validates :artist_name, presence: true, uniqueness: true
    validates :artist_details, presence: true
    validates :artist_kana, presence: true

    def favorite_user(id)
    favorites.find_by(user_id: id)
  end

end
