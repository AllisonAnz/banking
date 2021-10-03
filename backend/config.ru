require 'rack/cors'
require_relative "./config/environment.rb"

use Rack::Cors do

    allow do
        origins '*'
        resource '/*', headers: :any, methods: [:GET, :POST, :PATCH, :put, :delete, :options]  
    end
end


run Application.new
