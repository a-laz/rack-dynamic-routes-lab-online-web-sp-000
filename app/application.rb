class Application
  @@item = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@item.find{|i| i.name == item_name}
        resp.write "#{@@item.find(item_name).price}"
      else
        resp.write ""
        resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
