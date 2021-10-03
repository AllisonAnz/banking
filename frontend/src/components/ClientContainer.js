import React, { Component } from 'react'
import ContactInfo from './ContainerComponents/ContactInfo.js'
import Transactions from './ContainerComponents/Transactions.js'

export class ClientContainer extends Component {
    constructor(){
        super()
        this.state = {
            firstName: "",
            lastName: "",
            contactInfo: [],
            checking: [],
            savings: [],
            showAccount: null,
            transactions: [],
            account: [],
            accountTransactions: []

        }
    }
    
    async componentDidMount(){
        try{
       const response = await fetch(`http://localhost:9393/clients/${this.props.match.params.id}`)
        const data = await response.json()
        this.setState({
            firstName: data.first_name,
            lastName: data.last_name,
            contactInfo: data.contact_info,
            checking: data.checking_accounts,
            savings: data.saving_accounts,
            transactions: data.transactions
        })
    } catch (error) {
        console.log(error)
        }
    }

    handleClick(e, account) {
        e.preventDefault()
        this.setState({showAccount: true})
        const transactions = []
        this.state.transactions.map( transaction => {
            if (transaction.checking_account_id === account.id) {
                transactions.push(transaction)
            }
            return this.setState({accountTransactions: transactions})
        })
    }

    render() {
        return (
            <>
                <div className="container mt-4 mb-4 p-3 d-flex justify-content-center">
                    <div className="card p-4">
                        <h1>{this.state.firstName} {this.state.lastName}</h1>
                        <ContactInfo contactInfo={this.state.contactInfo} />
                    </div>
                    <div className="card p-5">
                        <h3>Accounts: </h3>
                        <ul>
                            {this.state.checking.map(account =>
                                <li key={account.id}>
                                    Checking: {account.account_number} Balance: {account.balance} <span></span>
                                    <button onClick={(event)=>this.handleClick(event, account)}>View Account</button>
                                </li>)}
                        </ul>
                        <br/>
                        <ul>
                            {this.state.savings ? this.state.savings.map(account =>
                                <li key={account.id}>
                                    Savings: {account.account_number} Balance: {account.balance} <span></span>
                                </li>) : ""}
                        </ul>
                    </div>
                </div>
                <div className="container justify-content-center">
                    <div className="card p-6">
                        {this.state.showAccount ? 
                            < Transactions transactions={this.state.accountTransactions}/> : ""}
                    </div>
                </div>
            </>
        )
    }
}

export default ClientContainer
