class Element < ActiveRecord::Base
    has_many :moves
    has_many :players, :through => :moves

  def self.add_elements
    
    elements = []
    
    
    page = Nokogiri::HTML(open('http://www.webelements.com/nexus/content/list-elements-atomic-number'))
    
    page.css(".content td a").each do |x|
      elements << x.children.text
    end
    
    fulltable = []
    
    elements.each do |y|
      begin
        element = Element.create(name: y, weight: PeriodicTable.lookup(y).weight)
      rescue
        next element = Element.create(name: y)
      end

    end
  end
               
end  