# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

game = Game.create(:title => 'Soil')
group = game.groups.create(:groupname => 'test', :password => 'testing')
7.times do |i|
  game.save!
  round = group.rounds.create(:number => i)
  field = round.create_field
  40.times do |p|
    field.parcels.create(:nutrition => (80 - i*10), :soil => (80 - i*10), :cropsequence => 'gut', :harvest => 'gut', :plantation => 'Brachland')
  end
  result = round.create_result(:machines => '100', :organic => 'false')
end