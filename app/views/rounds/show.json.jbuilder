json.(@round,:id, :number)
json.field_attributes do
  json.id @round.field.id
  json.parcels_attributes @round.field.parcels, :id, :nutrition, :soil, :cropsequence, :harvest, :plantation
end
json.decision_attributes @round.decision, :id, :machines, :organic, :pesticide, :fertilize, :organisms
