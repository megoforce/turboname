require 'open-uri'
puts ' ________  _____  ___  ____  _  _____   __  _______'
puts '/_  __/ / / / _ \/ _ )/ __ \/ |/ / _ | /  |/  / __/'
puts ' / / / /_/ / , _/ _  / /_/ /    / __ |/ /|_/ / _/  '
puts '/_/  \____/_/|_/____/\____/_/|_/_/ |_/_/  /_/___/  '
puts '    finding a domain name for you since 1854'                                                   
def generate_name
  dicc_begin = Array.new
  dicc_middle = Array.new
  dicc_end = Array.new
   
  #dictionary-begin.txt to array dicc_begin
  i = 0  
  while line = File.readlines("dictionary-begin.txt")[i]
    dicc_begin[i] = line.gsub("\n","")
    i = i + 1
  end
  
  #dictionary-begin.txt to array dicc_begin
  i = 0  
  while line = File.readlines("dictionary-middle.txt")[i]
    dicc_middle[i] = line.gsub("\n","")
    i = i + 1
  end
  
  #dictionary-begin.txt to array dicc_begin
  i = 0  
  while line = File.readlines("dictionary-end.txt")[i]
    dicc_end[i] = line.gsub("\n","")
    i = i + 1
  end

  length = rand(2)+2
  name = ""
  for i in 1..length
    #first pseudosyllable
    if (i == 1)
      if(rand(99)<30) #30% use begin dicctionary
        name += dicc_begin[rand(dicc_begin.length-1)]
      else
        name += dicc_middle[rand(dicc_middle.length-1)]
      end
    end
    
    #middle pseudosyllable    
    name += dicc_middle[rand(dicc_middle.length-1)] if (i > 1 && i < length)
    
    #end pseudosyllable
    if (i == length)
      if (rand(99)<80) #80% use end dicctionary
        name += dicc_end[rand(dicc_end.length-1)]
      else
        name += dicc_middle[rand(dicc_middle.length-1)]
      end
    end
    
  end
  
  return name
  
end

def searchtld(word)
  domain=word+".com"
  countrytlds = [
          'ac',
          'ad','ae','af','ag',
          'ai','al','am','an',
          'ao','aq','ar','as',
          'at','au','aw','ax',
          'az','ba','bb','bd',
          'be','bf','bg','bh',
          'bi','bj','bm','bn',
          'bo','br','bs','bt',
          'bu','bv','bw','by',
          'bz','ca','cc','cd',
          'cf','cg','ch','ci',
          'ck','cl','cm','cn',
          'co','cr','cs','cu',
          'cv','cx','cy','cz',
          'de','dj','dk','dm',
          'do','dz','ec','ee',
          'eg','eh','er','es',
          'et','eu','fi','fj',
          'fk','fm','fo','fr',
          'ga','gb','gd','ge',
          'gf','gg','gh','gi',
          'gl','gm','gn','gp',
          'gq','gr','gs','gt',
          'gu','gw','gy','hk',
          'hm','hn','hr','ht',
          'hu','id','ie','il',
          'im','in','io','iq',
          'ir','is','it','je',
          'jm','jo','jp','ke',
          'kg','kh','ki','km',
          'kn','kp','kr','kw',
          'ky','kz','la','lb',
          'lc','li','lk','lr',
          'ls','lt','lu','lv',
          'ly','ma','mc','md',
          'me','mg','mh','mk',
          'ml','mm','mn','mo',
          'mp','mq','mr','ms',
          'mt','mu','mv','mw',
          'mx','my','mz','na',
          'nc','ne','nf','ng',
          'ni','nl','no','np',
          'nr','nu','nz','om',
          'pa','pe','pf','pg',
          'ph','pk','pl','pm',
          'pn','pr','ps','pt',
          'pw','py','qa','re',
          'ro','rs','ru','rw',
          'sa','sb','sc','sd',
          'se','sg','sh','si',
          'sj','sk','sl','sm',
          'sn','so','sr','st',
          'su','sv','sy','sz',
          'tc','td','tf','tg',
          'th','tj','tk','tl',
          'tm','tn','to','tp',
          'tr','tt','tv','tw',
          'tz','ua','ug','uk',
          'us','uy','uz','va',
          'vc','ve','vg','vi',
          'vn','vu','wf','ws',
          'ye','yt','yu','za',
          'zm','zw',
  ]
  countrytlds.each do |tld|
    last2=word[word.length-2,word.length-1]
    domain=word[0,word.length-2]+"."+tld if last2==tld
  end
  return domain
end
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
    line=line.gsub(vowels.sample,vowels.sample)
  end
  return searchtld(line)
end
100999032982389.times do
  randomname=newname()
    if randomname.length<15
    result=domainsearch(randomname)
    if result==true
      puts "Domain found: "+randomname
      `echo "#{randomname}" >> names.txt`
    end
  end
end
