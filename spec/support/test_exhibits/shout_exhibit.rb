class ShoutExhibit < Exhibitionist::Base
  def say(string)
    __getobj__.say(string).upcase
  end
end
