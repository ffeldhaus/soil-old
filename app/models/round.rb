class Round < ActiveRecord::Base
  belongs_to :group
  has_one :field, :autosave => true
  has_one :result, :autosave => true
end
