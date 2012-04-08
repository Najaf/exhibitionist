
# Exhibitionist

Super-lightweight decorators, as inspired by Avdi Grimms [Objects on Rails](http://objectsonrails.com/).

## Installation

Add this line to your application's Gemfile:

    gem 'exhibitionist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exhibitionist

## Usage

An Exhibit is just a subclass of SimpleDelegator, organized via the Exhibitionist module.

Create exhibits by subclassing ```Exhibitionist::Base``:

```ruby
class StringExhibit < Exhibitionist::Base
  # this exhibit applies to objects that respond to :to_s
  applies_if {|object| object.responds_to?(:to_s) }
end
```

Here are some example exhibits.

```ruby
class ShoutExhibit < StringExhibit
  def shout
    __getobj__.to_s.upcase
  end
end

class WhisperExhibit < StringExhibit
  def whisper
    "<whisper>#{__getobj__.to_s.downcase}</whisper>"
  end
end

class ExclaimExhibit < StringExhibit
  def exclaim
    "#{__getobj__.to_s}!"
  end
end
```

Another exhibit, that applies to nothing:

```ruby
class NeverAppliedExhibit < Exhibitionist::Base
  applies_if { |object| false }

  def boom
    "#{__getobj__.to_s} shakalaka"
  end
end
```

Register all your exhibits with the ```Exhibitionist``` module:

```ruby
Exhibitionist.register ShoutExhibit, WhisperExhibit, ExclaimExhibit, NeverAppliedExhibit
```

Now calling ```Exhibitionist.exhibit(obj)``` will get you your object, wrapped with applicable exhibits.

```ruby
exhibit = Exhibitionist.exhibit "Hello, world"

exhibit.shout            #=> "HELLO, WORLD"
exhibit.whisper          #=> "<whisper>hello, world</whisper>"
exhibit.exclaim          #=> "Hello, world!"
exhibit.boom             #=> NoMethodError, as object is not wrapped by NeverAppliedExhibit
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

