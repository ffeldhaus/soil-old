class Income < ActiveRecord::Base
  belongs_to :result
  has_one :harvest

  after_initialize do
    self.create_harvest unless self.harvest
  end
end
