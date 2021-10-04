import React from 'react'
import { useHistory } from 'react-router-dom'

export default function DeleteClient(props) {
    const history = useHistory()

    
    const handleDelete = () => {
        
        var requestOptions = {
            method: 'DELETE',
            redirect: 'follow'
        };

        fetch("http://localhost:9393/clients/" + props.client , requestOptions)
            .then(response => response.json())
            .then(history.push(`/clients/`))
            .catch(error => console.log('error', error));
    }
    return (
        <div>
            <button type="button" className="btn btn-sm btn-outline-secondary" onClick={handleDelete}>Delete Client</button>
        </div>
    )
}
