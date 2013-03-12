class Round < ActiveRecord::Base
  belongs_to :group
  has_one :field, :autosave => true, :dependent => :destroy
  has_one :decision, :autosave => true, :dependent => :destroy
  has_one :result, :autosave => true, :dependent => :destroy

  accepts_nested_attributes_for :field, :decision

  MACHINE_AGING = 5

  SOIL = 80
  SOIL_FALLOW = 0.1
  SOIL_CROPSEQUENCE = 0.03
  SOIL_FIELDBEAN = 0.02
  SOIL_OAT = 0.02
  SOIL_RYE = 0.02
  SOIL_BEET = 0.02
  SOIL_FERTILIZE = 0.05
  SOIL_ANIMALS = 0.02
  SOIL_PESTICIDE = 0.04
  SOIL_MACHINE = 0.05
  SOIL_MONOCULTURE = 0.02
  SOIL_FLOOD = 0.05
  SOIL_DROUGHT = 0.03

  NUTRITION = 80
  NUTRITION_DECLINE = 0.5
  NUTRITION_FERTILIZE = 0.5
  NUTRITION_ANIMALS = 0.4
  NUTRITION_FIELDBEAN = 0.2

  HARVEST = {'Tiere' => 0, 'Brachland' => 0, 'Ackerbohne' => 60, 'Gerste' => 95, 'Hafer' => 70, 'Kartoffel' => 370, 'Mais' => 110, 'Roggen' => 100, 'Weizen' => 115, 'Zuckerruebe' => 570}
  HARVEST_SOIL = {'Tiere' => 0, 'Brachland' => 0, 'Ackerbohne' => 1, 'Gerste' => 1.1, 'Hafer' => 1, 'Kartoffel' => 1.1, 'Mais' => 1, 'Roggen' => 1, 'Weizen' => 1.1, 'Zuckerruebe' => 1}
  HARVEST_NUTRITION = {'Tiere' => 0, 'Brachland' => 0, 'Ackerbohne' => 0.9, 'Gerste' => 0.9, 'Hafer' => 1, 'Kartoffel' => 1.1, 'Mais' => 1, 'Roggen' => 0.9, 'Weizen' => 1.1, 'Zuckerruebe' => 1.1}
  HARVEST_WEATHER = {'Tiere' => {'Kälte' => 1, 'Dürre' => 1, 'Überschwemmung' => 1},
                     'Brachland' => {'Kälte' => 1, 'Dürre' => 1, 'Überschwemmung' => 1},
                     'Ackerbohne' => {'Kälte' => 0.9, 'Dürre' => 0.8, 'Überschwemmung' => 0.8},
                     'Gerste' => {'Kälte' => 0.8, 'Dürre' => 0.8, 'Überschwemmung' => 0.8},
                     'Hafer' => {'Kälte' => 0.8, 'Dürre' => 0.9, 'Überschwemmung' => 0.8},
                     'Kartoffel' => {'Kälte' => 0.8, 'Dürre' => 0.9, 'Überschwemmung' => 0.8},
                     'Mais' => {'Kälte' => 0.8, 'Dürre' => 0.9, 'Überschwemmung' => 0.8},
                     'Roggen' => {'Kälte' => 0.9, 'Dürre' => 0.9, 'Überschwemmung' => 0.8},
                     'Weizen' => {'Kälte' => 0.8, 'Dürre' => 0.9, 'Überschwemmung' => 0.8},
                     'Zuckerruebe' => {'Kälte' => 0.8, 'Dürre' => 0.8, 'Überschwemmung' => 0.8}}
  HARVEST_VERMIN = {'Tiere' => {'Blattlaus' => false, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Brachland' => {'Blattlaus' => false, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Ackerbohne' => {'Blattlaus' => true, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Gerste' => {'Blattlaus' => false, 'Frittfliege' => true, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Hafer' => {'Blattlaus' => false, 'Frittfliege' => true, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Kartoffel' => {'Blattlaus' => false, 'Frittfliege' => false, 'Kartoffelkäfer' => true, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Mais' => {'Blattlaus' => false, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => true, 'Drahtwurm' => false},
                    'Roggen' => {'Blattlaus' => true, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Weizen' => {'Blattlaus' => true, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => false},
                    'Zuckerruebe' => {'Blattlaus' => false, 'Frittfliege' => false, 'Kartoffelkäfer' => false, 'Maiszünsler' => false, 'Drahtwurm' => true}}
  HARVEST_CROPSEQUENCE = 0.2
  HARVEST_EFFICIENCY = 0.05
  HARVEST_MACHINES = 0.5
  HARVEST_ANIMALS = 10


  MACHINES = 100

  CROPSEQUENCE = {'Ackerbohne' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'gut', 'Hafer' => 'gut', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'gut', 'Weizen' => 'gut', 'Zuckerruebe' => 'gut'},
                  'Gerste' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'schlecht', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'gut', 'Weizen' => 'gut', 'Zuckerruebe' => 'ok'},
                  'Hafer' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'schlecht', 'Kartoffel' => 'ok', 'Mais' => 'gut', 'Roggen' => 'gut', 'Weizen' => 'gut', 'Zuckerruebe' => 'ok'},
                  'Kartoffel' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'ok', 'Kartoffel' => 'schlecht', 'Mais' => 'ok', 'Roggen' => 'ok', 'Weizen' => 'ok', 'Zuckerruebe' => 'ok'},
                  'Mais' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'schlecht', 'Hafer' => 'ok', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'schlecht', 'Weizen' => 'schlecht', 'Zuckerruebe' => 'gut'},
                  'Roggen' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'gut', 'Hafer' => 'gut', 'Kartoffel' => 'gut', 'Mais' => 'ok', 'Roggen' => 'gut', 'Weizen' => 'ok', 'Zuckerruebe' => 'ok'},
                  'Weizen' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'schlecht', 'Hafer' => 'ok', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'schlecht', 'Weizen' => 'schlecht', 'Zuckerruebe' => 'gut'},
                  'Zuckerruebe' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'ok', 'Kartoffel' => 'gut', 'Mais' => 'ok', 'Roggen' => 'ok', 'Weizen' => 'ok', 'Zuckerruebe' => 'schlecht'},
                  'Brachland' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'gut', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'gut', 'Weizen' => 'gut', 'Zuckerruebe' => 'gut'},
                  'Tiere' => {'Tiere' => 'gut', 'Brachland' => 'gut', 'Ackerbohne' => 'gut', 'Gerste' => 'ok', 'Hafer' => 'gut', 'Kartoffel' => 'gut', 'Mais' => 'gut', 'Roggen' => 'gut', 'Weizen' => 'gut', 'Zuckerruebe' => 'gut'}}

  after_initialize do
    self.number ||= self.group.game.nextRound
    self.create_decision(:machines => '0', :organic => false, :pesticide => false, :fertilize => false, :organisms => false) unless self.decision
    self.create_result(:machines => MACHINES, :organic => 'false', :weather => 'Normal', :vermin => 'Keine') unless self.result
    self.create_field unless self.field
  end

  def calculate_attributes
    rounds = self.group.rounds
    # self is the new round,
    # the current round is the round before it
    # the previous round is the round before the current one
    current_round = rounds.find_by_number(self.number-1)
    if rounds.length > 2
      previous_round = rounds.find_by_number(self.number-2)
    else
      previous_round = Round.new(:number => 0)
    end

    ## overview
    animals = field.parcels.select { |parcel| parcel.plantation=='Tier' }.length
    if animals > 0
      animals_per_parcel = 40.to_f/(animals*8)
    else
      animals_per_parcel = 0
    end
    ### machines
    if previous_round.decision.machines.to_i > 0
      self.result.machines = previous_round.result.machines + previous_round.decision.machines
    else
      self.result.machines -= MACHINE_AGING
    end
    ### organic
    self.result.organic = true if animals_per_parcel.between?(0.8, 1.2) && previous_round.decision.fertilize == false && previous_round.decision.pesticide == false
    ### weather
    self.result.weather = self.group.game.weather[self.number-2]
    ### vermin
    self.result.vermin = self.group.game.vermin[self.number-2]

    self.field.parcels.each do |new_parcel|
      current_parcel = current_round.field.parcels.find_by_number(new_parcel.number)
      previous_parcel = previous_round.field.parcels.find_by_number(new_parcel.number)

      # copy values from parcel of current round to parcel of new round
      new_parcel.plantation = current_parcel.plantation
      new_parcel.soil = current_parcel.soil
      new_parcel.nutrition = current_parcel.nutrition

      # identify cropsequence
      new_parcel.cropsequence = CROPSEQUENCE[current_parcel.plantation][previous_parcel.plantation]

      # calculate soil
      soil_factor = 0
      # Tiere
      if current_parcel.plantation == 'Tiere'
        soil_factor = soil_factor
      elsif current_parcel.plantation == 'Brachland'
        # Brachland
        soil_factor += 0.01 * [SOIL - current_parcel.soil, 0].max * SOIL_FALLOW
      else
        # Fruchtfolge
        soil_factor += SOIL_CROPSEQUENCE if new_parcel.cropsequence == 'gut'
        soil_factor -= SOIL_CROPSEQUENCE if new_parcel.cropsequence == 'schlecht'
        # Getreidesorte
        case current_parcel.plantation
          when 'Ackerbohne'
            soil_factor += SOIL_FIELDBEAN
          when 'Hafer'
            soil_factor += SOIL_OAT
          when 'Roggen'
            soil_factor += SOIL_RYE
          when 'Zuckerruebe'
            soil_factor += SOIL_BEET
        end
        # Dünger
        soil_factor -= SOIL_FERTILIZE if current_round.decision.fertilize
        soil_factor -= ([animals_per_parcel, 1].max - 1) * SOIL_ANIMAILS if animals_per_parcel > 0
        # Pflanzenschutz
        soil_factor -= SOIL_PESTICIDE if current_round.decision.pesticide
        # Maschineneinsatz
        soil_factor -= (0.01 * (self.result.machines - MACHINES)) * (0.01 * 2 * current_parcel.soil - 0.5) * SOIL_MACHINE
        # Monokultur
        round_counter = 0
        monoculture = (current_parcel.plantation == previous_parcel.plantation)
        while monoculture
          round_counter += 1
          if rounds.count > round_counter + 2
            monoculture = (current_parcel.plantation == rounds.find_by_number(self.number - 2 - round_counter).field.parcels.find_by_number(new_parcel.number).plantation)
          else
            monoculture = false
          end
        end
        soil_factor -= round_counter * SOIL_MONOCULTURE
        # Wetter
        soil_factor -= SOIL_DROUGHT if self.result.weather == 'Dürre'
        soil_factor -= SOIL_FLOOD if self.result.weather == 'Überschwemmung'
      end
      # Berechnung Bodenqualität
      new_parcel.soil += current_parcel.soil * soil_factor

      # calculate nutrition
      # Brachland oder Tiere
      if current_parcel.plantation == 'Tiere' || current_parcel.plantation == 'Brachland'
        new_parcel.nutrition = NUTRITION if current_parcel.nutrition > NUTRITION
      else
        nutrition_factor = 0
        nutrition_factor -= (1-0.01*current_parcel.soil) * 0.01 * current_parcel.nutrition * NUTRITION_DECLINE
        nutrition_factor += (1-0.01*current_parcel.nutrition) * NUTRITION_FERTILIZE if current_round.decision.fertilize
        nutrition_factor += (1-(1-animals_per_parcel).abs) * NUTRITION_ANIMALS if animals_per_parcel > 0
        nutrition_factor += 0.01 * current_parcel.soil * NUTRITION_FIELDBEAN if current_parcel.plantation == 'Ackerbohne'
        new_parcel.nutrition += current_parcel.nutrition * nutrition_factor
      end

      # calculate harvest
      puts current_parcel.plantation
      harvest = HARVEST[current_parcel.plantation]
      puts harvest
      # Nährstoffe
      harvest *= (current_parcel.nutrition.to_f/NUTRITION) ** HARVEST_NUTRITION[current_parcel.plantation]
      puts "Nutrition: " + current_parcel.nutrition.to_s
      puts harvest
      # Bodenqualität
      harvest *= (current_parcel.soil.to_f/SOIL) ** HARVEST_SOIL[current_parcel.plantation]
      puts "Soil: " + current_parcel.soil.to_s
      puts harvest
      # Wetter
      harvest *= HARVEST_WEATHER[current_parcel.plantation][self.result.weather] unless self.result.weather == 'Normal'
      puts harvest
      # Schädlinge
      if HARVEST_VERMIN[current_parcel.plantation][self.result.vermin]
        if self.decision.pesticide
          harvest *= 1
        elsif self.decision.organisms
          harvest *= 0.8
        else
          harvest *= 0.5
        end
      end
      puts harvest
      # Fruchtfolge
      case new_parcel.cropsequence
        when 'gut'
          harvest *= 1 + HARVEST_CROPSEQUENCE
        when 'ok'
          harvest *= 1
        when 'schlecht'
          harvest *= 1 - HARVEST_CROPSEQUENCE
      end
      puts harvest
      # Vorfrucht / Effizienz
      round_counter = 0
      efficiency = (current_parcel.plantation == previous_parcel.plantation)
      while efficiency
        round_counter += 1
        if rounds.count > round_counter + 2
          efficiency = (current_parcel.plantation == rounds.find_by_number(self.number - 2 - round_counter).field.parcels.find_by_number(new_parcel.number).plantation)
        else
          efficiency = false
        end
      end
      puts harvest
      harvest *= 1 + round_counter * HARVEST_EFFICIENCY
      puts harvest
      harvest *= 1 + HARVEST_EFFICIENCY**2 * (current_round.field.parcels.select { |parcel| parcel.plantation == current_parcel.plantation }.length - 1)
      puts harvest
      # Maschineneinsatz
      harvest *= (0.01 * self.result.machines)**HARVEST_MACHINES
      puts harvest
      # Nahrung Tiere
      harvest *= (1 - animals_per_parcel / HARVEST_ANIMALS)
      puts harvest
      new_parcel.harvest_yield = harvest.to_i
      puts "Harvest am ende:" + new_parcel.harvest_yield.to_s
      harvest_ratio = harvest/HARVEST[current_parcel.plantation]
      if harvest_ratio > 1.2
        new_parcel.harvest = 'sehr_hoch'
      elsif harvest_ratio > 0.9
        new_parcel.harvest = 'hoch'
      elsif harvest_ratio > 0.6
        new_parcel.harvest = 'maessig'
      elsif harvest_ratio > 0.3
        new_parcel.harvest = 'niedrig'
      elsif harvest_ratio > 0
        new_parcel.harvest = 'sehr_niedrig'
      else
        new_parcel.harves = 'keiner'
      end
    end
    # finance
    ## seeds
    ### fieldbean

    ### barley
    ### oat
    ### potatoes
    ### corn
    ### rye
    ### wheat
    ### beet
    ## investments
    ### animals
    ### machines
    ## running costs
    ### organic control
    ### fertilize
    ### pesticide
    ### organisms
    ### animals
    ### basic cost
    ## harvest
    ### fieldbean
    ### barley
    ### oat
    ### potatoes
    ### corn
    ### rye
    ### wheat
    ### beet
    ## profit
    ## capital
  end
end
