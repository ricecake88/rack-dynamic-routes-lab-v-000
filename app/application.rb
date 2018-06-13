class Application
  
  #@@items = []
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match("/items/")
      search_item = req.path.split("/items/").last
      item = @@items.find {|item| item.name == search_item}
      if item == nil
        resp.status = 400
      else
        resp.write "#{item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end

end
