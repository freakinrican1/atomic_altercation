class Element < ActiveRecord::Base
  has_many :moves
  has_many :players, :through => :moves
  
  
  
  
  
  
  def self.add_elements
    
    elements = []
    
    page = Nokogiri::HTML(open('http://www.webelements.com/nexus/content/list-elements-atomic-number'))
    
    page.css(".content td a").each do |x|
      elements << x.children.text
    end

  end


end  