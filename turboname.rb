require 'open-uri'

def domainsearch(name)
  if (`whois #{name}`).include?("No match for") 
    true
  else
    false
  end
end
`wc -l dictionary.txt`
def newname
  line = File.readlines("dictionary.txt")[rand(36000)-1].gsub("\n","")
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
