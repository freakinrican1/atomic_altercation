require 'rubygems'
require 'bundler'
require 'open-uri'

Bundler.require

require_relative './models/element.rb'
require_relative './models/player.rb'
require_relative './models/moves.rb'



get "/" do
  
  erb :home
end

get "/startgame" do 
  
  
  
  @element_names = Element.uniq.pluck(:name)
  
  $p1 = Player.create(name: params["p1"])
  $p2 = Player.create(name: params["p2"])
  erb :startgame
end


get "/battle" do 
  
  @p1_element = Element.where(name: params["p1_element"])[0]
  @p2_element = Element.where(name: params["p2_element"])[0]
  
 
  # @p1_move = Move.create(player_id: $p1.id, element_id: Element.where(name: params["p1_element"])[0].id)
 #  @p2_move = Move.create(player_id: $p2.id, element_id: Element.where(name: params["p2_element"])[0].id)
 #
  
  erb :battle
end



#------------------------------------------------

#Index
get "/admin/all_elements" do 
  @all_elements = Element.all 
  
  erb :"elements/elements_all"

end

#New
get "/admin/new_element" do 
  
  erb :"elements/element_new"
end


#Create
post "/admin/create_element" do 
  @element = Element.create({name: params[:name], weight: params[:weight],comic: params[:comic]})
  
  erb :"elements/element_create"
end


#Edit
get "/admin/:id/edit_element" do 
  @element = Element.find(params[:id])
  
  erb :"elements/element_edit"
end


#Update
post "/admin/:id/update_element" do 
  
  @element = Element.find(params[:id])
  @element.update_attributes({name: params[:name], weight: params[:weight], comic: params[:comic]})
  
  erb :"elements/element_update"
end

#Show
get "/admin/elements/:id" do 
  @element = Element.find(params[:id])
  
  erb :"elements/element_detail"
  
end

#Show
get "/admin/elements/:id/delete" do 
   Element.delete(params[:id])
  
  erb :"elements/element_delete"
  
end





