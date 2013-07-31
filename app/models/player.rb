class Player < ActiveRecord::Base
  belongs_to :game
  has_many :rounds, :autosave => true, :dependent => :destroy
  accepts_nested_attributes_for :rounds
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create
  validates :name, :presence => true, :uniqueness => true, :length => {:in => 4..64}
end
