class Game < ActiveRecord::Base
  has_many :players, :autosave => true, :dependent => :destroy
  belongs_to :supervisor

  validates :name, :presence => true, :uniqueness => true, :length => {:in => 4..64}

  after_initialize do
    self.current_round ||= 1
#    self.weather ||= ['Normal'] + ['Normal', 'Normal', 'Normal', 'Dürre', 'Kälte', 'Überschwemmung'].shuffle
#    self.vermin ||= ['Keine'] + ['Keine', 'Blattlaus', 'Frittfliege', 'Kartoffelkäfer', 'Maiszünsler', 'Drahtwurm'].shuffle
  end

  def nextRound
    self.players.collect {|player| player.rounds.count}.min + 1
  end
end
