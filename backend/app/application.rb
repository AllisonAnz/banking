class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
     
    elsif req.path.match(/checking_accounts/)
          return [200, { 'Content-Type' => 'application/json' }, [ CheckingAccount.all.to_json]]
        
    elsif req.path.match(/clients/)

      if req.env["REQUEST_METHOD"] === 'GET'
        
        if(req.path.split("/clients/").length <= 1)
          return [200, { 'Content-Type' => 'application/json' }, [ Client.all.to_json({:include => [:contact_info, :checking_accounts, :saving_accounts]}) ]]
          
        elsif
          client_id = req.path.split("/clients/").last
          client = Client.find_by(id: client_id)
          return [200, { 'Content-Type' => 'application/json' }, [ client.to_json({:include => [:contact_info, :checking_accounts, :saving_accounts, :transactions]}) ]]
        end
      elsif req.env["REQUEST_METHOD"] === 'POST'
         return [200, { 'Content-Type' => 'application/json' }, ["Its working".to_json]]]
      
     
     
      end
  


    
  
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
