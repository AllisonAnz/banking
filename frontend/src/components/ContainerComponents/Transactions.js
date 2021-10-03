import React from 'react'

export default function Transactions(props) {
    return (
        <table className="ui celled striped padded table">
            <thead>
                <tr>
                    <th>
                        <h3 className="ui center aligned header">Date</h3>
                    </th>
                    <th>
                        <h3 className="ui center aligned header">Description</h3>
                    </th>
                    <th>
                        <h3 className="ui center aligned header">Amount</h3>
                    </th>
                </tr>
            </thead>
            <tbody>
                {props.transactions.map(transaction => {
                    return(
                    <tr key={transaction.id}>
                        <td>{transaction.date}</td>
                        <td>{transaction.description}</td>
                        <td>{transaction.amount}</td>
                    </tr>)
                })}
            </tbody>
        </table>
    )
}
