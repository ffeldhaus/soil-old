json.group(@group) do |json, group|
  json.id group.id
  json.number group.groupnumber
  json.rounds group.rounds
end