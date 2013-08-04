class ParcelSerializer < ActiveModel::Serializer
  attributes :id, :number, :nutrition, :soil, :cropsequence, :harvest_yield, :harvest, :plantation
end
