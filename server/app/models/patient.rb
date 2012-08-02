class Patient < ActiveRecord::Base
  has_one :historical
  validates_presence_of :firstname, :lastname,:dni, :address
end
