class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :notifications, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :lives, dependent: :destroy
  has_many :fes_likes, dependent: :destroy
  has_many :fes_comments, dependent: :destroy

  attachment :profile_image

end
