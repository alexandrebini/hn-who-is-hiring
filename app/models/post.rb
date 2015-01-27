class Post < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  scope :recent, -> { order('published_at DESC') }
end