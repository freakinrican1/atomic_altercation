task :import_elements do
  
  Element.delete_all
  
  elements = []
  
  puts "begin nokogiri scrape"
  page = Nokogiri::HTML(open('http://www.webelements.com/nexus/content/list-elements-atomic-number'))
  
  page.css(".content td a").each do |x|
    elements << x.children.text
     puts "scraping nokogiri"
  end
  
  puts "nokogiri scrape complete"
  
  fulltable = []
  
  
  elements.each do |y|
    begin
      puts "looking up element #{y}"
      element = Element.create(name: y, weight: PeriodicTable.lookup(y).weight)
      puts "created element #{element} with the name #{element.name} an id #{element.id}" 
    rescue
      next element = Element.create(name: y)
      puts "created element #{element} with the name #{element.name} an id #{element.id}" 
    end
  end

  end
