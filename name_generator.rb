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
