class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :photo, :posts_counter
 end