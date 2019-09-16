require 'pry'
class Application

    def call(env)
        response = Rack::Response.new
        request = Rack::Request.new(env)

   
        if request.path.match(/items/)

            item_name = request.path.split("/items/").last
            item = @@items.find{|s| s.name == item_name}

            if @@items.include?(item)
                response.write item.price
            else
                response.status = 400
                response.write "Item not found"
            end
        else
            response.status = 404
            response.write "Route not found"
        end
        response.finish
    end

end