class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :weather, :vermin
  has_many :players
end
