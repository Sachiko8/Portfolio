class FesComment < ApplicationRecord
	belongs_to :fe
	belongs_to :user
	has_many :fes_likes, dependent: :destroy

	validates :contents, presence: true, length: { maximum: 200 }

	def fes_like_user(id)
		fes_likes.find_by(user_id: id)
    end

end
