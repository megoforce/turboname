require 'open-uri'

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
  line=line.gsub(vowels.choice,vowels.choice) 
  return line+".com"
end
puts "HELLO";
100.times do
  randomname=newname()
  result=domainsearch(randomname)
  if result==true
    puts randomname
  end
end
