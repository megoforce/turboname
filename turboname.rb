require 'open-uri'
require 'tld.rb'
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
  line = File.readlines("dictionary.txt")[rand(349899)-1].gsub("\n","")
  2.times do
    line=line.gsub(vowels.choice,vowels.choice) if rand(1)==1
  end
  return searchtld(line)
end
puts "HELLO";
100.times do
  randomname=newname()
  result=domainsearch(randomname)
  if result==true
    puts randomname
    `echo "#{randomname}" >> names.txt`
  end
end
