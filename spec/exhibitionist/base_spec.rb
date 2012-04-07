require 'spec_helper'
require 'test_exhibits/shout_exhibit'
require 'test_exhibits/stutter_exhibit'
describe Exhibitionist::Base do

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

  describe '#class' do
    it 'returns the class of the wrapped object' do
      double_exhibit.class.must_equal Speaker
    end
  end

end
