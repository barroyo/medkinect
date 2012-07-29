class Role < ActiveRecord::Base
   has_many :users
   validates_presence_of :title, :description,:access
end
