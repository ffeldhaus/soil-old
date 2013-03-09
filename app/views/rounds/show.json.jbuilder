json.extract! @round, :number
json.field do
  json.parcels @round.field.parcels, :nutrition, :soil, :cropsequence, :harvest, :plantation
end