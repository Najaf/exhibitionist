class ShoutExhibit < Exhibitionist::Base
  def say(string)
    __getobj__.say(string).upcase
  end
  
  def self.applicable_to?(object)
    false
  end
end
