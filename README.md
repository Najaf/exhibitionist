# Nothing to see here

Move along...

P.S. If you want some presenters for your ActiveRecords, use [draper](https://github.com/jcasimir/draper), it's awesome.

# Exhibitionist

Super-lightweight decorators.

## Installation

Add this line to your application's Gemfile:

    gem 'exhibitionist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exhibitionist

## Usage

    ```ruby
    class ShoutExhibit < Exhibitionist::Base
      applies_if {|object| object.responds_to?(:to_s) }

      def shout
        __getobj__.to_s.upcase
      end
    end

    Exhibitionist.register ShoutExhibit

    exhibit = Exhibitionist.exhibit "hello, world"

    exhibit.shout #=> "HELLO, WORLD"
    ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
