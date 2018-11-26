class Place < ApplicationRecord
	has_many :lives, dependent: :destroy
	has_many :fes, dependent: :destroy

	validates :place, presence: true, length: { minimum:2, maximum: 50 }
end
