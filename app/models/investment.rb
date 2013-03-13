class Investment < ActiveRecord::Base
  belongs_to :expense

  after_initialize do
    self.animals ||= 0
    self.machines ||= 0
  end
end
