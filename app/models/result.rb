class Result < ActiveRecord::Base
  belongs_to :round
  has_one :expense
  has_one :income

  after_initialize do
    self.profit ||= 0
    self.capital ||= 20000
    self.create_expense unless self.expense
    self.create_income unless self.income
  end
end
