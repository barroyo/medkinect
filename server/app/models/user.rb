class User < ActiveRecord::Base
  belongs_to :role
  has_many :specialismships
  has_many :specialisms, :through => :specialismships
end
