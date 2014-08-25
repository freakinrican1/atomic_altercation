class Player < ActiveRecord::Base
  has_many :moves 
  has_many :elements, :through => :moves
  
  validates :name, presence: true
  
  
    
    
  
  
  
  
  
  
  
  
  
  
end
