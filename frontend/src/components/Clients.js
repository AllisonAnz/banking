
import React, { useState, useEffect } from 'react'
import ClientLink from './ClientLink'

export default function Clients() {
    const [clients, setClients] = useState([])
    const clientApi = 'http://localhost:9393/clients'

    
    
    useEffect(() => {

        let mounted = true
        fetch(clientApi)
            .then(res => res.json())
            .then((data) => {
                if (mounted) {
                    setClients(data)
                }
            })
            return () => {
                mounted = false
            }
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