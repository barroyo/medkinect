class User < ActiveRecord::Base
  belongs_to :role
  has_many :specialismships
  has_many :specialisms, :through => :specialismships
  def self.authenticate(username, password)
    find(:first,:conditions => [ "username = '%s' AND password = '%s'", username, Digest::MD5.hexdigest(password)])
  end
end
