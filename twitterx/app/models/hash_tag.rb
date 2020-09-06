class HashTag < ApplicationRecord
  has_many :tweet_hash_tags, dependent: :destroy
  has_many :tweets, through: :tweet_hash_tags, dependent: :destroy
end
