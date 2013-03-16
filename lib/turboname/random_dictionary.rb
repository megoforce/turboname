module Turboname
  class Random < Dictionary
    # let's get a random word out of the dictionary and modify it, also randomly
    def get
      vowels = ["a","e","i","o","u"]
      line = File.readlines(File.join(Turboname::path, 'dictionary.txt'))[rand(435000)-1].gsub("\n","")
      rand(20).times do
        line = line.gsub(vowels.shuffle.first, vowels.shuffle.first)
      end
      line
    end
  end
end
