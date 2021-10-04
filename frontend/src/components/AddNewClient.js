import React, { useState } from 'react'
import { useHistory } from 'react-router-dom'

export default function AddNewClient() {
    const [formVal, setFormVal] = useState({
        firstName: "",
        lastName: ""
    })
    const {firstName, lastName} = formVal
    const history = useHistory()

    const handleChange = (e) => {
        
        setFormVal({
            ...formVal, 
            [e.target.name]: e.target.value
        })
    } 

    const handleSubmit = (e) => {
        e.preventDefault()
        //var formdata = new FormData();
        //formdata.append("first_name", firstName);
        //formdata.append("last_name", lastName);

        var requestOptions = {
            method: 'POST',
            body: JSON.stringify({first_name: firstName, last_name: lastName}),
            redirect: 'follow'
        };

        fetch("http://localhost:9393/clients/", requestOptions)
            .then(response => response.json)
            .then(client => history.push(`/clients/${client.id}`))
            .catch(error => console.log('error', error));
    }


    return (
        <div className="container">] <div className=" text-center mt-5 ">
            <h1>Add New Client</h1>
        </div>
            <div className="row ">
                <div className="col-lg-7 mx-auto">
                    <div className="card mt-2 mx-auto p-4 bg-light">
                        <div className="card-body bg-light">
                            <div className="container">
                                <form id="contact-form" onSubmit={handleSubmit}>
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
                                               
                                            </div>
                                        </div>
                                            <div className="col-md-12"> <input type="submit" className="btn btn-success btn-send pt-2 btn-block " value="Submit" /> </div>
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
