require 'delegate'
module Exhibitionist
  class Base < SimpleDelegator
    def class
      __getobj__.class
    end
  end
end
