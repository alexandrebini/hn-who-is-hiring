class JobSerializer < ActiveModel::Serializer
  attributes :user, :description, :url, :published_at
end