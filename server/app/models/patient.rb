class Patient < ActiveRecord::Base
  has_one :historical
  validates_presence_of :firstname, :lastname,:dni, :address
  def fullname
  	"#{self.firstname} #{self.lastname}"
  end
end
