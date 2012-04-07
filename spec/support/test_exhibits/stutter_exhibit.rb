class StutterExhibit < Exhibitionist::Base
  def say(string)
    "Ummm... #{__getobj__.say(string)}"
  end
end
