class User < ActiveRecord::Base
  has_one :role
end
