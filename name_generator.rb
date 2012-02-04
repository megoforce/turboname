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
  
  length = rand(1)+2
  name = ""
  for i in 1..length
    if (i == 1 && rand(99)<30)
      name += dicc_begin[rand(dicc_begin.length-1)]
    else
      name += dicc_middle[rand(dicc_middle.length-1)]
    end
    
    name += dicc_middle[rand(dicc_middle.length-1)] if (i > 1 && i < length)
    name += dicc_end[rand(dicc_end.length-1)] if (i == length && rand(99)<80)
  end
  
  return name
  
end
