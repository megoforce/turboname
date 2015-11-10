# Turboname

Do you have a project that needs a short domain name, while maintaining some sense of redability?
This little tool will choose some random word in spanish or english, mix syllables, vocals until it finds a .com domain name available for that strange, made up-word.

While most of the results aren't that exiting you can find a gem watching the results of the script finding domain names.


## Usage from the command line
#### Installation
fire up your terminal and run:

    $ gem install turboname
    
(if you're using OS X's default ruby install you will need to do ```sudo gem install turboname```

####  Usage
put some turboname magic in your terminal and light it up by doing:

    $ turboname

You will see something like
```
 ________  _____  ___  ____  _  _____   __  _______
/_  __/ / / / _ \/ _ )/ __ \/ |/ / _ | /  |/  / __/
 / / / /_/ / , _/ _  / /_/ /    / __ |/ /|_/ / _/
/_/  \____/_/|_/____/\____/_/|_/_/ |_/_/  /_/___/
    finding a domain name for you since 1856
orgoits.com              IS available
padianamas.com           IS available
padianam.as              is not available
cabazin.com              IS available
cabaz.in                 IS available
stipad.com               IS available
stip.ad                  is not available
corcarse.com             IS available
corcar.se                IS available
```

All the results are saved to a file called ```names.txt```.
To close the app just press ```ctrl + c```

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
