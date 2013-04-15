module Turboname
  class Domain
    CountryTLDs = %w{ac ad ae af ag ai al am an ao aq ar as at au aw ax az ba bb bd be bf bg bh bi bj bm bn bo br bs bt bu bv bw by bz ca cc cd cf cg ch ci ck cl cm cn co cr cs cu cv cx cy cz de dj dk dm do dz ec ee eg eh er es et eu fi fj fk fm fo fr ga gb gd ge gf gg gh gi gl gm gn gp gq gr gs gt gu gw gy hk hm hn hr ht hu id ie il im in io iq ir is it je jm jo jp ke kg kh ki km kn kp kr kw ky kz la lb lc li lk lr ls lt lu lv ly ma mc md me mg mh mk ml mm mn mo mp mq mr ms mt mu mv mw mx my mz na nc ne nf ng ni nl no np nr nu nz om pa pe pf pg ph pk pl pm pn pr ps pt pw py qa re ro rs ru rw sa sb sc sd se sg sh si sj sk sl sm sn so sr st su sv sy sz tc td tf tg tj tk tl tm tn to tp tr tt tv tw tz ua ug uk us uy uz va vc ve vg vi vn vu wf ws ye yt yu za zm zw}
  
    attr_accessor :name
  
    def initialize opts = {}
      self.name = opts[:from].respond_to?(:get) ? opts[:from].get : opts[:from] if opts[:from]
    end
  
    # let's remove the tld at the end of the domain. eljojo -> eljo.jo | asdfk -> asdfk.jo
    def with_tld tld
      @name[-tld.length..-1] == tld ? @name[0..-tld.length-1] + ".#{tld}" : "#{@name}.#{tld}"
    end
  
    def save tld = 'com'
      `echo "#{with_tld(tld)}" >> names.txt`
    end
  
    def available? tld = nil
      tld = 'com' if tld.nil?
      name_with_tld = with_tld(tld)
      print name_with_tld
      begin
        domain = Whois.whois(name_with_tld)
        available = domain.available?
      rescue
        available = false
      end
      puts "#{' '*(25 - name_with_tld.length)}#{available ? 'IS' : 'is not'} available"
      available
    end
  
    def tldize
      last_letters = self.name[-2..-1]
      last_letters if CountryTLDs.include?(last_letters)
    end
    
    # this will not include the tld
    def to_s
      @name
    end
  
    def length
      @name.length
    end
  end
end
