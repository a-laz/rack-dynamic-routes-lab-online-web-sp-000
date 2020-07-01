class Application
  @@item = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path==(/items/item_name)
      item_name = req.params["q"]
      if @@item.find(item_name)
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
