class Field < ActiveRecord::Base
  belongs_to :round
  has_many :parcels, :autosave => true
end
