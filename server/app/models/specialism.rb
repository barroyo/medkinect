class Specialism < ActiveRecord::Base
  has_many :user
  validates_presence_of :description, :title
end
