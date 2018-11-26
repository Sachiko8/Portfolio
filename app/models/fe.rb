class Fe < ApplicationRecord
	belongs_to :place
	has_many :fes_comments, dependent: :destroy

    validates :fes_name, presence: true, length: { minimum:2, maximum: 50 }
    validates :fes_day, presence: true
    validates :place_id, presence: true
end
