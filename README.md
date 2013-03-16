# Turboname

Do you have a project that needs a short domain name, while maintaining some sense of redability?
This little tool will choose some random word in spanish or english, mix syllables, vocals until it finds a .com domain name available for that strange, made up-word.

While most of the results aren't that exiting you can find a gem watching the results of the script finding domain names.

Based on [Megoforce](https://github.com/megoforce/turboname)'s Turboname


## From the command line
#### Installation
Install the gem, from your terminal.

    $ gem install turboname
    
####  Usage
fire up your terminal and run:

    $ turboname
    

#### You might also need
    - Precious time
    - Frustration tolerance.
    - Water and Food
    - Maybe a blanket.

## From your Ruby app

Add this line to your application's Gemfile:

    gem 'turboname'

And then execute:

    $ bundle
    
Now you should be able to run something like:

```ruby
    require 'turboname'
    dictionary = Turboname::Random.new

    100999032982389.times do
      name = Turboname::Domain.new(:from => dictionary)
      name.save if name.length < 15 and name.available?
      tld = name.tldize
      name.save(tld) if tld and name.length < 15 and name.available?(tld)
    end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

![Commit](http://i.imgur.com/jQL14.png)