class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :published_at
end