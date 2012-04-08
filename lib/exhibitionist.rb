require "exhibitionist/version"
require 'exhibitionist/base'

module Exhibitionist
  @@exhibits = []
  def self.exhibits
    @@exhibits
  end

  def self.exhibits=(exhibits)
    @@exhibits = exhibits
  end

  def self.register(*exhibits)
    @@exhibits += exhibits
    nil
  end
end
