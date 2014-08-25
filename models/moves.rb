class Move < ActiveRecord::Base
  
    belongs_to :elements
    belongs_to :players


end