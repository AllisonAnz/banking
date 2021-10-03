import React from 'react'
import { Link } from 'react-router-dom'

const ClientLink = ({ client }) => {
    return (
        <Link to={`/clients/${client.id}`}>
            <h3><li>{client.first_name +" "+ client.last_name}</li></h3>
        </Link>
    )
}

export default ClientLink
