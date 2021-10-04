class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
     
    elsif req.path.match(/checking_accounts/)
          return [200, { 'Content-Type' => 'application/json' }, [ CheckingAccount.all.to_json]]
        
    elsif req.path.match(/clients/) && req.get?
    

        if(req.path.split("/clients/").length <= 1)
          return [200, { 'Content-Type' => 'application/json' }, [ Client.all.to_json({:include => [:contact_info, :checking_accounts, :saving_accounts]}) ]]
          
        elsif
          client_id = req.path.split("/clients/").last
          client = Client.find_by(id: client_id)
          return [200, { 'Content-Type' => 'application/json' }, [ client.to_json({:include => [:contact_info, :checking_accounts, :saving_accounts, :transactions]}) ]]
        end
    elsif  req.path.match(/clients/) && req.post?
        input = JSON.parse(req.body.read)
        client = Client.create(last_name: input["last_name"], first_name: input["first_name"])
        return [200, { 'Content-Type' => 'application/json' }, [client.to_json ]]
    elsif req.path.match(/clients/) && req.delete?
      id = req.path.split("/clients/").last
      Client.find(id).delete 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "Task deleted!"}.to_json ]]

     
     
     
    
  


    
  
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
