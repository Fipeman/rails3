class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  validates :content, presence: true
  accepts_nested_attributes_for :user
  paginates_per 5
end
