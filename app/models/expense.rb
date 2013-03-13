class Expense < ActiveRecord::Base
  belongs_to :result
  has_one :seed
  has_one :investment
  has_one :running_cost

  after_initialize do
    self.sum ||= 0
    self.create_seed unless self.seed
    self.create_investment unless self.investment
    self.create_running_cost unless self.running_cost
  end
end
