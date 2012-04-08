class WhisperExhibit < Exhibitionist::Base
  def say(string)
    "<whisper>#{__getobj__.say(string)}</whisper>"
  end

  def self.applicable_to?(object)
    true
  end
end
