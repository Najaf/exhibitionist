require "exhibitionist/version"
require 'exhibitionist/base'

module Exhibitionist
  @@exhibits = []

  class << self
    def exhibits
      @@exhibits
    end

    def exhibits=(exhibits)
      @@exhibits = exhibits
    end

    def register(*exhibits)
      @@exhibits += exhibits
      nil
    end

    def exhibit(object)
      if @@exhibits.empty?
        return object
      else
        exhibit = @@exhibits.first
        return exhibit.applicable_to?(object) ? exhibit.new(object) : object
      end
    end
  end
end
