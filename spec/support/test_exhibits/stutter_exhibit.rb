class StutterExhibit < Exhibitionist::Base
  def say(string)
    "Ummm... #{__getobj__.say(string)}"
  end

  def self.applicable_to?(object)
    true
  end
end
