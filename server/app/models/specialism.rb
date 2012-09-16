class Specialism < ActiveRecord::Base
  has_many :user
  validates_uniqueness_of :title
  validates_presence_of :description, :title
end
