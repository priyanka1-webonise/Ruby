require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'

$array1 = Array.new
$array2 = Array.new
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a/@href').each_with_index do |node, i|
   $arr1 << node.text
  break if i == 12;
 end

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node, i|
   $arr2 << node.text
  break if i == 12;
 end


$array2.each do |a1|
puts a1
end


$array1.each do |a2|
puts a2
end
dd="pp"
puts dd
require 'active_record'  
ActiveRecord::Base.establish_connection(  
:adapter => "mysql",  
:host => "localhost",  
:database => "simple_recipes"  
)  
  
class simple_recipe < ActiveRecord::Base  
end  
simple_recipe.create(:name => $val., :city => "")  

$i=0
while i<10 do 
$val=$arr2.at[i]
puts $val
simple_recipe.create(:recipe_id => i, :recipe_name => "$val")  

end
