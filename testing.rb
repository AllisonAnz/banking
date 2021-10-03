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