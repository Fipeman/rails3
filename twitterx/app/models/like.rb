class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  accepts_nested_attributes_for :tweet
  accepts_nested_attributes_for :user
end
