class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :image_url, presence: true
  has_many :tweets, dependent: :destroy 
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy

  has_many :follower_users, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
  has_many :followings, through: :follower_users, source: :following, dependent: :destroy
  has_many :following_users, foreign_key: :following_id, class_name: "Follow", dependent: :destroy
  has_many :followers, through: :following_users, source: :follower, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
