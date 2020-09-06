class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :tweet_hash_tags
  has_many :hash_tags, through: :tweet_hash_tags
  validates :content, presence: true
  accepts_nested_attributes_for :user
  paginates_per 5

  after_commit :create_hash_tags, on: :create

  def create_hash_tags
    extract_tag_hash_tags.each do |tag|
      hash_tags.create(tag: tag)
    end
  end
  
  def extract_tag_hash_tags
    content.to_s.scan(/#\w+/).map{|tag| tag.gsub("#", "")}
  end
end
