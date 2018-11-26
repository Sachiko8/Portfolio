class Live < ApplicationRecord

	belongs_to :artist
	belongs_to :place
	has_many :comments, dependent: :destroy

    validates :when, presence: true
    validates :place_id, presence: true
    validates :live_title, presence: true, length: { maximum: 50 }
    validates :artist_id, presence: true

end
