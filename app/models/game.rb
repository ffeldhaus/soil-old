class Game < ActiveRecord::Base
  has_many :groups, :autosave => true, :dependent => :destroy
  serialize :weather
  serialize :vermin

  after_initialize do
    self.weather ||= ['Normal'] + ['Normal', 'Normal', 'Normal', 'Dürre', 'Kälte', 'Überschwemmung'].shuffle
    self.vermin ||= ['Keine'] + ['Keine', 'Blattlaus', 'Frittfliege', 'Kartoffelkäfer', 'Maiszünsler', 'Drahtwurm'].shuffle
  end

  def nextRound
    self.groups.collect {|group| group.rounds.count}.min + 1
  end
end
