require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'active_record'

$arr1 = Array.new
$arr2 = Array.new
doc = Nokogiri::HTML(open('http://www.simplyrecipes.com/index/'))

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a/@href').each_with_index do |node, i|
   $arr1 << node.text
  break if i == 12;
 end

doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "entry-content", " " ))]//p/a').each_with_index do |node, i|
   $arr2 << node.text
  break if i == 12;
 end


$arr2.each do |a|
puts a
end


$arr1.each do |b|
puts b
end



require 'active_record'  
ActiveRecord::Base.establish_connection(  
:adapter => "mysql",  
:host => "localhost",  
:database => "ruby",
:username => "root",
:password => "webonise6186"
)  

class Recipe < ActiveRecord::Base
end  


$i=0
while i<10 do 
$val=$arr2.at[i]
$val1=$arr.at[i]
puts $val
puts $val1
Recipe.create(:rec_id => i,:rec_name => $val,:rec_url => $val1)  
end


