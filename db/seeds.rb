# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

game = Game.create(:title => 'Soil')
game.groups.create(:groupname => 'Gruppe1', :password => 'sinus',:wait_for_other_groups=>false)
game.groups.create(:groupname => 'Gruppe2', :password => 'cosinus',:wait_for_other_groups=>false)
game.groups.create(:groupname => 'Gruppe3', :password => 'tangens',:wait_for_other_groups=>false)
game.groups.create(:groupname => 'Gruppe4', :password => 'sekans',:wait_for_other_groups=>false)
game.groups.each do |group|
  game.save!
  group.rounds.create(:number => 1)
end