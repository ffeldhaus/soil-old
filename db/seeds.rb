# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SEEDCAPITAL=20000

admin = Admin.create(:name => 'administrator', :password => 'administrator', :password_confirmation => 'administrator')
admin.save!
supervisor = admin.supervisors.create(:name => 'ffeldhaus', :first_name => 'Florian', :last_name => 'Feldhaus', :email => 'florian.feldhaus@gmail.com', :password => 'ffeldhaus', :password_confirmation => 'ffeldhaus')
supervisor.save!

game = supervisor.games.create(:name => 'Soil')

game.players.create(:name => 'Gruppe1', :seedcapital => SEEDCAPITAL, :password => 'testing', :password_confirmation => 'testing')
game.players.create(:name => 'Gruppe2', :seedcapital => SEEDCAPITAL, :password => 'cosinus', :password_confirmation => 'cosinus')
#game.players.create(:name => 'Gruppe3', :seedcapital => SEEDCAPITAL, :password => 'tangens')
#game.players.create(:name => 'Gruppe4', :seedcapital => SEEDCAPITAL, :password => 'sekans')
game.save!