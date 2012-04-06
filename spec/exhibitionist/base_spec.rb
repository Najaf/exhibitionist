require 'spec_helper'
describe Exhibitionist::Base do

  class ShoutExhibit < Exhibitionist::Base
    def say(string)
      __getobj__.say(string).upcase
    end
  end

  class StutterExhibit < Exhibitionist::Base
    def say(string)
      "Ummm... #{__getobj__.say(string)}"
    end
  end

  class Speaker
    def say(string)
      string
    end
  end

  let(:bare) { Speaker.new }

  let(:exhibit) { ShoutExhibit.new(bare) }

  let(:double_exhibit) { StutterExhibit.new(exhibit) }

  it 'decorates methods' do
    bare.say('woof').must_equal 'woof'
    exhibit.say('woof').must_equal 'WOOF'
  end

  it 'allows multiple exhibits to wrap an object' do
    double_exhibit.say('meow').must_equal 'Ummm... MEOW'
  end


end
