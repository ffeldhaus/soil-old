class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :game_id
  has_many :rounds
end
