class Round < ActiveRecord::Base
  belongs_to :group
  has_one :field, :autosave => true, :dependent => :destroy
  has_one :decision, :autosave => true, :dependent => :destroy
  has_one :result, :autosave => true, :dependent => :destroy

  accepts_nested_attributes_for :field, :decision
end
