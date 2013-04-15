require 'spec_helper'
describe Turboname::Dictionary do
  
  # Base Dictionary. returns nothing.
  context 'Base Dictionary' do
    it "responds to get" do
      @dictionary = Turboname::Dictionary.new
      @dictionary.should respond_to :get
    end
  end
  
  # random dictionary, based on /lib/dictionary.txt
  context 'Random Dictionary' do
    before do
      @dictionary = Turboname::Random.new
    end
    it "responds to get" do
      @dictionary.should respond_to :get
    end
    it "returns a word" do
      @dictionary.get.should =~ /[\w]+/
    end
  end
end