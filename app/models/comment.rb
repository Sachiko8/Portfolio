class Comment < ApplicationRecord
	belongs_to :live
	belongs_to :user
	has_many :likes, dependent: :destroy

	validates :contents, presence: true, length: { maximum: 200 }

	def like_user(id)
    likes.find_by(user_id: id)
  end

end
