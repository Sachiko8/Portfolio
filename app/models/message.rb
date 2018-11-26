class Message < ApplicationRecord

	validates :name, presence: true
	validates :mail, presence: true
	validates :text, presence: true
end
