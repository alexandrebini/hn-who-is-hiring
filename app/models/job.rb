class Job < ActiveRecord::Base
  belongs_to :post
  scope :recent, -> { order('published_at DESC') }
end