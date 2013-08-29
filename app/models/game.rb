class Game < ActiveRecord::Base
  has_many :players, :autosave => true, :dependent => :destroy
  belongs_to :supervisor
  serialize :weather
  serialize :vermin

  validates :name, :presence => true, :uniqueness => true, :length => {:in => 4..64}

  after_initialize do
    self.weather ||= %w|Normal| + %w|Normal Normal Normal Normal Dürre Kälte Überschwemmung Dürre Kälte Überschwemmung|.shuffle
    self.vermin ||= %w|Keine| + %w|Keine Blattlaus Fritfliege Kartoffelkäfer Maiszünsler Drahtwurm Blattlaus Fritfliege Kartoffelkäfer Maiszünsler Drahtwurm|.shuffle
  end

  def start_new_round
    if Round.where(game_id: self.id).all? { |round| round.submitted }
      Player.where(game_id: self.id).each do |player|
        next_round = player.rounds.create(number: player.rounds.length + 1, game_id: self.id)
        next_round.calculate_attributes
      end
    end
  end

end
