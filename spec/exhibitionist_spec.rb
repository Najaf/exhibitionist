require 'spec_helper'
require 'test_exhibits/shout_exhibit'
require 'test_exhibits/stutter_exhibit'
require 'test_exhibits/whisper_exhibit'

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

    it 'wraps multiple registered exhibits, if applicable' do
      Exhibitionist.register ShoutExhibit, StutterExhibit, WhisperExhibit
      wrapped = Exhibitionist.exhibit(speaker)
      # we make no assumptions about order, so it could be either of the following
      possible = ['<whisper>Ummm... meow</whisper>', 'Ummm... <whisper>meow</whisper>']
      possible.must_include wrapped.say('meow')
    end
  end

  #describe '.register_dir' do
    #it 'registers all the exhibits in a directory' do
      #Exhibitionist.register_dir 'test_exhibits'
      #Exhibitionist.exhibits.must_equal [EmptyExhibit, ShoutExhibit, StutterExhibit, WhisperExhibit]
    #end
  #end
end
