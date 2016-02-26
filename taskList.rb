class Crawler
  def initialize(uri,query)
     @request_uri = uri
     @request_query = query
     @url = "#@request_uri#@request_query"
  end

  def readdata
   @buffer = open(@url).read
  end
 
  def convertdata
   @doc = Nokogiri::HTML(@buffer)
   #puts @doc
  end
  def printdata
   @productbox = @doc.css('div.products-box')
   @productname = @doc.css('h2.product-name a')
   @productprice = @doc.css('div.price')
   @products = {}
   f = File.new("newfile2",  "w")
   #f.write(@productbox)
   #print @productbox.length
   j = 0
   @productbox.each do |i|
     @productname = i.css('h2.product-name a').text.concat("#{j}")
     @products[@productname] = {}
     @products[@productname][:price]=0
     @products[@productname][:newprice]=0
     @products[@productname][:oldprice]=0
     
     if i.css('div.price span.price-old').text != "" && i.css('div.price span.price-old').text!=""
        @products[@productname][:newprice]=i.css('div.price span.price-new').text
        @products[@productname][:oldprice]=i.css('div.price span.price-old').text
        
     else
        print "#{j}"
        @products[@productname][:price]=i.css('div.price').text       
     end
   
    
     #print "#@products \n"
     j +=1
   end
   print @products.length
   f.write(@products)
end

require 'open-uri'
require 'json'
require 'pp'
require 'nokogiri'

# Construct the URL we'll be calling
request_uri = 'https://www.salwardunia.com/'
request_query = ''
object_crawl = Crawler.new(request_uri,request_query)

object_crawl.readdata
object_crawl.convertdata
object_crawl.printdata


end

