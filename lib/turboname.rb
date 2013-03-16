require "turboname/version"
require "turboname/domain"
require "turboname/dictionary"
require "turboname/random_dictionary"
require "whois"

module Turboname
  # all the logic is in the other files
  
  # helper
  def self.path
    File.dirname(__FILE__)
  end
end