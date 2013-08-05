class RoundSerializer < ActiveModel::Serializer
  attributes :id, :number, :submitted

  has_one :field
  has_one :decision
  has_one :result
end
