require 'spec_helper'
require 'test_exhibits/shout_exhibit'
require 'test_exhibits/stutter_exhibit'

describe Exhibitionist do

  class Speaker
    def say(string)
      string
    end
  end

  let(:speaker) { Speaker.new }

  before do
    Exhibitionist.exhibits = []
  end

  describe '.exhibits' do
    it 'returns an empty array by default' do
      Exhibitionist.exhibits.must_equal []
    end 
  end

  describe '.register' do
    it 'returns nil' do
      Exhibitionist.register(Object.new).must_be_nil
    end

    it 'registers exhibit' do
      Exhibitionist.register ShoutExhibit
      Exhibitionist.exhibits.must_equal [ShoutExhibit]
    end

    it 'takes multiple exhibits' do
      Exhibitionist.register ShoutExhibit, StutterExhibit
      Exhibitionist.exhibits.must_equal [ShoutExhibit, StutterExhibit]
    end
  end

  describe '.exhibit' do
    it 'returns original object if there are no exhibits registered' do
      Exhibitionist.exhibits.must_equal []
      original = Exhibitionist.exhibit(speaker)
      original.say('woof').must_equal('woof')
    end

    it 'wraps original object if applicable' do
      Exhibitionist.register StutterExhibit
      wrapped = Exhibitionist.exhibit(speaker)
      wrapped.say('woof').must_equal('Ummm... woof')
    end
  end
end
