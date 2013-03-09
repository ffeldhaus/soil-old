class Group < ActiveRecord::Base
  has_many :rounds, :autosave => true, :dependent => :destroy
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create
  validates :groupname, :presence => true, :uniqueness => true, :length => {:in => 4..8}
end
