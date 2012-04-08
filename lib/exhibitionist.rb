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

    #def register_dir(directory)
      #raise Exhibitionist::Base.subclasses.inspect
      #File.expand_path(directory)
    #end

    def exhibit(object)
      @@exhibits.reduce object do |object, exhibit|
        exhibit.exhibit_if_applicable(object)
      end
    end
  end
end
