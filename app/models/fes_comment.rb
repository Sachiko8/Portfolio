class FesComment < ApplicationRecord
	belongs_to :fe
	belongs_to :user
	has_many :fes_likes, dependent: :destroy

	def fes_like_user(id)
    fes_likes.find_by(user_id: id)
  end

end
