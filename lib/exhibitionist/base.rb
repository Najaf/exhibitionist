require 'delegate'
module Exhibitionist
  class Base < SimpleDelegator
    def class
      __getobj__.class
    end

    def self.applicable_to?(object)
      false
    end

    def self.exhibit_if_applicable(object)
      applicable_to?(object) ? self.new(object) : object
    end
  end
end
