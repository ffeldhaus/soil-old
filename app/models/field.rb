class Field < ActiveRecord::Base
  belongs_to :round
  has_many :parcels, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :parcels

  after_initialize do
    40.times do |i|
      self.save!
      self.parcels.create(:number => i, :nutrition => (80), :soil => (80), :cropsequence => 'gut', :harvest => 'gut', :plantation => 'Brachland')
    end if self.parcels.count == 0
  end
end
