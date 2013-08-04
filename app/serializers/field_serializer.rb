class FieldSerializer < ActiveModel::Serializer
  attributes :id
  has_many :parcels
end
