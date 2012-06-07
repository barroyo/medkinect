class Patient < ActiveRecord::Base
  has_one :historical
  
end
