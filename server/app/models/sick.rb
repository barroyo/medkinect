class Sick < ActiveRecord::Base
	validates_presence_of :description, :title
	validates_uniqueness_of :title
end
