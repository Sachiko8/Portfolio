class FesLike < ApplicationRecord
	belongs_to :fes_comment
	belongs_to :user
end
