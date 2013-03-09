class Field < ActiveRecord::Base
  belongs_to :round
  has_many :parcels, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :parcels
end
