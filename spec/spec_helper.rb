require 'exhibitionist'

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'

MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new

