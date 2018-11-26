class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :fes_likes, dependent: :destroy
  has_many :fes_comments, dependent: :destroy

  attachment :profile_image


  validates :user_name, presence: true, length: { minimum:2, maximum: 20 }
  validates :nickname, presence: true, length: { minimum:2, maximum: 20 }
  validates :email, presence: true

end
