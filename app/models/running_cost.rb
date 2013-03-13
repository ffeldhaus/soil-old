class RunningCost < ActiveRecord::Base
  belongs_to :expense

  after_initialize do
    self.organic_control ||= 0
    self.fertilize ||= 0
    self.pesticide ||= 0
    self.organisms ||= 0
    self.animals ||= 0
    self.base ||= 0
  end
end
