require 'delegate'
module Exhibitionist
  class Base < SimpleDelegator
    def class
      __getobj__.class
    end

    class << self
      def applicable_to?(object)
        if @condition
          return @condition.yield(object)
        else
          false
        end
      end

      def exhibit_if_applicable(object)
        applicable_to?(object) ? self.new(object) : object
      end

      def applies_if(&block)
        @condition = block
      end

      def applies_unless(&block)
        @conditions = Proc.new { |object| !(block.yield(object)) }
      end
    end
  end
end
