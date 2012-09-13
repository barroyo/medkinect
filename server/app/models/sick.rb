class Sick < ActiveRecord::Base
	validates_presence_of :description, :title
end
