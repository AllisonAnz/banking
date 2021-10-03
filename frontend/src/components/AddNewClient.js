import React, { useState } from 'react'

export default function AddNewClient() {
    const [formVal, setFormVal] = useState({
        firstName: "",
        lastName: ""
    })
    const {firstName, lastName} = formVal

    const handleChange = (e) => {
        
        setFormVal({
            ...formVal, 
            [e.target.name]: e.target.value
        })
    } 

    const handleSubmit = (e) => {
        e.preventDefault()
        const clientApi = 'http://localhost:9393/'
        fetch(clientApi, {
            
            method: 'POST',
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json',
               
            },
            body: JSON.stringify({
                firstName
            })
        })
            

    }


    return (
        <div className="container">] <div className=" text-center mt-5 ">
            <h1>Bootstrap Contact Form</h1>
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
