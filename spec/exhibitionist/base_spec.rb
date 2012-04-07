require 'spec_helper'
require 'test_exhibits/empty_exhibit'
require 'test_exhibits/shout_exhibit'
require 'test_exhibits/stutter_exhibit'

describe Exhibitionist::Base do

  class Speaker
    def say(string)
      string
    end
  end

  let(:bare)           { Speaker.new }
  let(:exhibit)        { ShoutExhibit.new(bare) }
  let(:double_exhibit) { StutterExhibit.new(exhibit) }

  it 'decorates methods' do
    bare.say('woof').must_equal 'woof'
    exhibit.say('woof').must_equal 'WOOF'
  end

  it 'allows multiple exhibits to wrap an object' do
    double_exhibit.say('meow').must_equal 'Ummm... MEOW'
  end

  it '#class returns the class of the wrapped object' do
    double_exhibit.class.must_equal Speaker
  end

  it 'responds to applicable_to?' do
    StutterExhibit.must_respond_to :applicable_to?
  end

  it 'returns false for applicable_to? by default' do
    EmptyExhibit.applicable_to?(Object.new).must_equal false
  end

  describe '.exhibit_if_applicable' do
    it 'returns original object if not applicable' do
      original = ShoutExhibit.exhibit_if_applicable(bare)
      original.say('howl').must_equal 'howl'
    end

    it 'returns exhibited object if applicable' do
      exhibited = StutterExhibit.exhibit_if_applicable(bare)
      exhibited.say('growl').must_equal 'Ummm... growl'
    end
  end
end
