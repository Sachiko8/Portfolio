class Place < ApplicationRecord
	has_many :lives, dependent: :destroy
end
