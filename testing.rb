require 'faker'

#balance = Faker::Number.between(from: 0.0, to: 100000.0).round(2)
#
#puts balance
#
#class ChangeBalanceColumnSavings < ActiveRecord::Migration[5.2]
#  def change
#    change_column :saving_accounts, :balance, :decimal, :precision => 15, :scale => 2
#  end
#end

import React, { useState, useEffect } from 'react'
import ClientLink from './ClientLink'

export default function Clients() {
    const [clients, setClients] = useState([])
    const clientApi = 'http://localhost:9393/clients'

    
    
    useEffect(() => {
        fetch(clientApi)
            .then(res => res.json())
            .then(setClients)
    }, [clients])

    const [searchTerm, setSearchTerm] = useState("")
    const [searchResults, setSearchResults] = useState([])
    
    const handleChange = event => {

        const searchWord = event.target.value
        const searchWordCapitalized = searchWord.charAt(0).toUpperCase() + searchWord.slice(1)
        setSearchTerm(searchWordCapitalized)
    }

    useEffect(() => {
        const results = clients.filter(client =>
            client.last_name.includes(searchTerm)
        )
        setSearchResults(results)
    }, [clients, searchTerm])

    
    
    return (
        
        <>

            <div className="Clients">
                Enter Clients Name:
                <br />
                <input
                    type="text"
                    style={{ textTransform: "capitalize" }}
                    placeholder="Last Name"
                    value={searchTerm}
                    onChange={handleChange}
                />
                <br />
                <ul>
                    {searchTerm ? searchResults.map(client => <ClientLink key={client.id} client={client} />) : ""}
                </ul>
            </div>
        </>
    )
}

#---------------------------------------------------------
# Code that doesn't work 
# search by last and then first name 
import React, { useState, useEffect } from 'react'
import ClientLink from './ClientLink'

export default function Clients() {
    const [clients, setClients] = useState([])
    const clientApi = 'http://localhost:9393/clients'

    useEffect(() => {
        fetch(clientApi)
            .then(res => res.json())
            .then(setClients)
    })

    const [searchTerm, setSearchTerm] = useState({
        lastName: "",
        firstName: ""
    })
    const [searchResults, setSearchResults] = useState([])
    const handleChange = event => {
        const {name, value} = event.target 
        setSearchTerm({
            ...searchTerm,
            [name] : value
        })
    }

    useEffect(() => {
        const results = clients.filter(client =>
            client.last_name.includes(searchTerm.lastName))
        
        setSearchResults(results)
    }, [searchTerm.lastName])

    return (
        <>

            <div className="Clients">
                Enter Clients Name:
                <br />
                <input
                    type="text"
                    name="lastName"
                    placeholder="Last Name"
                    value={searchTerm.lastName}
                    onChange={handleChange}
                />
                <input
                    type="text"
                    name="firstName"
                    placeholder="First Name"
                    value={searchTerm.firstName}
                    onChange={handleChange}
                />
                <br />
                <ul>
                    {searchTerm ? searchResults.map(client => <ClientLink client={client} />) : ""}
                </ul>
            </div>
        </>
    )
}
#----------------------------------------------------------------------------------------------
<div class="container mt-4 mb-4 p-3 d-flex justify-content-right">
                <div class="card p-4">
                    <div class=" image d-flex flex-column justify-content-center align-items-left"> 
                        <button class="btn btn-secondary"> 
                            <img src="https://i.imgur.com/wvxPV9S.png" height="100" width="100" />
                        </button> 
                        <span class="name mt-3">{client.contact_info.street_address}</span>
                        <span class="idd">{client.contact_info.state} {client.contact_info.zip}</span>
                        <div class="d-flex flex-row justify-content-center align-items-center gap-2"> 
                            <span class="idd1">{client.contact_info.email}</span> <span><i class="fa fa-copy"></i></span> 
                        </div>
                        <span class="idd">{client.contact_info.phone}</span>
                      
                        </div>
                    </div>
                </div>
onClick={()=> setShowAccountForm(true)}

 {props.transactions.map(transaction => < Client key={transaction.id} transaction={transaction} searchTerm={props.searchTerm} />)}

 #------------------------------------------------------------------------------------------------
 import React, {useState, useEffect} from 'react'
//import { Container } from 'react-bootstrap';
import TransactionList from './transactionList';
//import { useHistory } from 'react-router-dom'

const Client = (props) => {
    const [client, setClient] = useState([])
    const [contactInfo, setContactInfo] = useState([])
    const [checking, setChecking] = useState([])
    const [showAccountForm, setShowAccountForm] = useState(null)
    //const history = useHistory()

    useEffect(() => {
        fetchClients();
    },[])

    const fetchClients = () => {
        fetch(`http://localhost:9393/clients/${props.match.params.id}`)
        .then(res => res.json())
        .then(client => {
            setClient(client)
            setContactInfo(client.contact_info)
            setChecking(client.checking_accounts)
        }, [])
        .catch(err => {console.log("error")})}

    const handleClick = (e) => {
        e.preventDefault()
        setShowAccountForm(true)
        
    }
    return (
        <>
            <div>
               <h1>{client.first_name} {client.last_name}</h1>
            </div>
            <div className="container mt-4 mb-4 p-3 d-flex justify-content-right">
                <div className="card p-4">
                    <div className=" image d-flex flex-column justify-content-center align-items-left">
                        <button className="btn btn-secondary">
                            <img src="https://i.imgur.com/wvxPV9S.png" height="100" width="100" />
                        </button>
                        <span className="name mt-3">{contactInfo.street_address}</span>
                        <span className="idd">{contactInfo.state}, {contactInfo.zip}</span>
                        <div className="d-flex flex-row justify-content-center align-items-center gap-2">
                            <span className="idd1">{contactInfo.email}</span> <span><i className="fa fa-copy"></i></span>
                        </div>
                        <span className="idd">{contactInfo.phone}</span>
                    </div>
                </div>
                <div className="row gutters-sm">
                <div className="card p-5">
                    <h3>Accounts: </h3><br/>
                    <ul>
                        {checking.map(account => 
                            <li key={account.id}> 
                                Checking: {account.account_number} Balance: {account.balance} <span></span>
                                <button onClick={(e)=>{<TransactionList onClick={handleClick(e)} account={props.account}/>}}>View Account</button>
                                </li>)}
                    </ul>
                </div>

                </div>
            </div>
            <div className="card p-5">
                {showAccountForm ? 
                    <div>
                      <TransactionList/>
                    </div> : ""}
                
            </div>
               
        </>
    )
}

export default Client

#-----------------------------------------------------------
 componentDidMount(){
        fetch(`http://localhost:9393/clients/${this.props.match.params.id}`)
        .then(res => res.json())
        .then(data => this.setState({
            firstName: data.first_name,
            lastName: data.last_name,
            contactInfo: data.contact_info,
            checking: data.checking_accounts,
            savings: data.saving_accounts
        }))
    }

#----------------------------------------------------------------------------------------
fetch(`http://localhost:9393/clients`, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
            },
            body: JSON.stringify({
               firatName: formValue.firstName,
               lastName: formValue.lastName
            })
        })
            .then(res => res.json())
            .then(client => {history.push(`/clients/${client.id}`)
                })

        
            
#--------------------------------------------------------------------------------
 elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        client = Client.create(firstName: input["firstName"], lastName: input["lastName"])

        res_client = {id: client.id, first_name: client.firstName, last_name: client.lastName}
        return [200, { 'Content-Type' => 'application/json' }, [{:client => res_client}.to_json ]]

#------------------------------------------------------------
return (
        <div className="container">] <div className=" text-center mt-5 ">
            <h1>Bootstrap Contact Form</h1>
        </div>
            <div className="row ">
                <div className="col-lg-7 mx-auto">
                    <div className="card mt-2 mx-auto p-4 bg-light">
                        <div className="card-body bg-light">
                            <div className="container">
                                <form id="contact-form">
                                    <div className="controls">
                                        <div className="row">
                                            <div className="col-md-6">
                                                <div className="form-group"> <label >Firstname *</label> <input value={firstName} onChange={handleChange} id="form_name" type="text" name="firstName" className="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required."/> </div>
                                            </div>
                                            <div className="col-md-6">
                                                <div className="form-group"> <label>Lastname *</label> <input value={lastName} onChange={handleChange} id="form_lastname" type="text" name="lastName" className="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required."/> </div>
                                            </div>
                                        </div>
                                        <div className="row">
                                            <div className="col-md-6">
                                                <div className="form-group"> <label>Email *</label> <input id="form_email" type="email" name="email" className="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required."/> </div>
                                            </div>
                                        </div>
                                            <div className="col-md-12"> <input type="submit" className="btn btn-success btn-send pt-2 btn-block " value="Send Message" onSubmit={handleSubmit}/> </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                </div> 
            </div>
        </div>
    )
}

#------------------------------------------------------------------------------------------------------------------------------
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
     
      binding.pry
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
     
     
     
      end
  


    
  
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end

#------------------------------------
 .then(client => history.push(`/clients/${client.id}`))

 # pry input => first_name, last_name 
 # input["last_name"] => get the last name

 Client.create(last_name: input["last_name"], first_name: input["first_name"])
 #=> Client created