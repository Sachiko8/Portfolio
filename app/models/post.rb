class Post < ApplicationRecord
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	belongs_to :user
	belongs_to :live
end
