class Game < ActiveRecord::Base
  has_many :players, :autosave => true, :dependent => :destroy
  belongs_to :supervisor

  validates :name, :presence => true, :uniqueness => true, :length => {:in => 4..64}

  after_initialize do
#    self.weather ||= ['Normal'] + ['Normal', 'Normal', 'Normal', 'Dürre', 'Kälte', 'Überschwemmung'].shuffle
#    self.vermin ||= ['Keine'] + ['Keine', 'Blattlaus', 'Frittfliege', 'Kartoffelkäfer', 'Maiszünsler', 'Drahtwurm'].shuffle
  end

  def start_new_round
    puts "in start new round"
    if self.players.load.all? { |player| player.rounds.load.all? { |round| round.submitted } }
      self.players.load.each do |player|
        puts player.id
        next_round = player.rounds.create(:number => 1)
        next_round.calculate_attributes
        puts "next player"
      end
    end
  end

end
