class Fe < ApplicationRecord
	belongs_to :place
	has_many :fes_comments, dependent: :destroy
end
