class Game < ActiveRecord::Base
  has_many :groups, :autosave => true, :dependent => :destroy
end
