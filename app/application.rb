class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path==(/items/)
      resp.write "Yay!"
    else
      resp.status = 404
    end
    resp.finish
  end
end
