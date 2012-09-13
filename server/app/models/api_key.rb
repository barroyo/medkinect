class ApiKey < ActiveRecord::Base

  before_create :generate_access_token

  def generate_access_token
    self.access_token = SecureRandom.hex
    while self.class.exists?(access_token: access_token) do
      self.access_token = SecureRandom.hex
    end
  end

end
