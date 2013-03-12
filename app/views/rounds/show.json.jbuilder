json.(@round,:id, :number)
json.field_attributes do
  json.id @round.field.id
  json.parcels_attributes @round.field.parcels, :id, :number, :nutrition, :soil, :cropsequence, :harvest, :harvest_yield, :plantation
end
json.decision_attributes @round.decision, :id, :machines, :organic, :pesticide, :fertilize, :organisms
