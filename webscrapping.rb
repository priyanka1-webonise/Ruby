require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'

require 'active_record'  
ActiveRecord::Base.establish_connection(  
:adapter => "mysql2",  
:host => "localhost",  
:database => "ruby",
:username => "root",
:password => "webonise6186"
)  

class Recipe < ActiveRecord::Base
end  


doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))


doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node, i|
   a=node.content;
   b=node['href']
  puts a
   puts b
#Recipe.create(:rec_id => i,:rec_name => a,:rec_url => b)

doc1 = Nokogiri::HTML(open(b))
doc1.xpath('//h2/a').each_with_index do |node, j|
c=node.content;
d=node['href']
#puts c


doc2 = Nokogiri::HTML(open(d))
e=doc2.xpath('//div[@itemprop="description"]')
#puts e.gsub!(/(<[^>]*>)|\n|\t/s){""}

image_url=doc2.xpath('//div[@class="featured-image"]/img/@src')
#puts image_url

ingredient=doc2.xpath('//div[@id="recipe-ingredients"]/ul/li[@class="ingredient"]').to_s() #.gsub!(/(<[^>]*>)|\n|\t/s){""}
ingredient.gsub!(/(<[^>]*>)|\n|\t/s){""}
#puts ingredient


method=doc2.xpath('//div[@id="recipe-method"]/div[@itemprop="recipeInstructions"]').to_s()
#puts method.gsub!(/(<[^>]*>)|\n|\t/s){""}
					
Recipe.create(:rec_id => i,:rec_name => a,:rec_url => b,:rec_des => e,:rec_img_url => image_url,:rec_ingre => ingredient,:rec_method => method)
			
end


  break if i == 5;
end




