class Place < ApplicationRecord
	has_many :lives, dependent: :destroy
	has_many :fes, dependent: :destroy
end
