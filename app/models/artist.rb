class Artist < ApplicationRecord
	has_many :lives, dependent: :destroy
	has_many :movies, dependent: :destroy
	belongs_to :favorite
end
