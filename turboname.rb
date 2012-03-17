require 'open-uri'
require 'tld.rb'
require 'name_generator.rb'
`touch names.txt`
def domainsearch(name)
  if (`whois #{name}`).include?("No match for") 
    true
  else
    false
  end
end
def newname
  vowels=["a","e","i","o","u"]
  line = File.readlines("dictionary.txt")[rand(435000)-1].gsub("\n","")
  rand(20).times do
    line=line.gsub(vowels.choice,vowels.choice)
  end
  return searchtld(line)
end
100999032982389.times do
  randomname=newname()
    if randomname.length<10
    result=domainsearch(randomname)
    if result==true
      puts randomname
      `echo "#{randomname}" >> names.txt`
    end
  end
end
