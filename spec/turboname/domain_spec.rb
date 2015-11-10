require 'spec_helper'
describe Turboname::Domain do
  context 'basic functionality' do
    it "gets the name out of regular strings" do
      domain = Turboname::Domain.new(:from => 'pineapple')
      domain.name.should == 'pineapple'
    end
    it "gets the name out of objects that respond to :get" do
      dictionary = Turboname::Random.new
      domain = Turboname::Domain.new(:from => dictionary)
      domain.name.should =~ /[\w]+/
    end
    it "adds the tld at the end of a domain when it matches" do
      domain = Turboname::Domain.new(:from => 'pineapple')
      domain.with_tld('apple').should == 'pine.apple'
      domain.with_tld('orange').should == 'pineapple.orange'
    end
    it "responds to :to_s" do
      domain = Turboname::Domain.new(:from => 'pineapple')
      domain.to_s.should == 'pineapple'
      domain.to_s.length.should == 'pineapple'.length
    end
  end
  context "TLDs" do
    it "finds TLDs at the end of domains, when they exist" do
      domain = Turboname::Domain.new(:from => 'turboname')
      domain.tldize.should == 'me'
    end
    it "finds TLDs at the end of domains, when they don't exist" do
      domain = Turboname::Domain.new(:from => 'turbona.xx')
      domain.tldize.should be_nil
    end
  end
  context "WHOIS" do
    it "tells if a domain is available" do
      # please don't break this test by buying this domain ;)
      domain = Turboname::Domain.new(:from => 'eljojorsasdffasdasd')
      domain.available?.should == true
    end
    it "tells if a domain is NOT available" do
      domain = Turboname::Domain.new(:from => 'google')
      domain.available?('com').should == false
    end
  end
end