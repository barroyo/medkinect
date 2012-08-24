class User < ActiveRecord::Base
  belongs_to :role
  has_many  :calendar
  has_many :specialismships
  has_many :specialisms, :through => :specialismships
  validates_presence_of :username, :email,:password, :fullname
  validates_uniqueness_of :username, :email
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email format"
  validates_format_of :username, :with => /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/, :message => "Invalid no numbers or special characters allowed"
  def self.authenticate(username, password)
		find(:first,:conditions => [ "username = '%s' AND password = '%s' and status = 'en'", username, Digest::MD5.hexdigest(password)])
  end
end
