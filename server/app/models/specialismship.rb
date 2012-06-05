class Specialismship < ActiveRecord::Base
  belongs_to :user
  belongs_to :specialism
end
