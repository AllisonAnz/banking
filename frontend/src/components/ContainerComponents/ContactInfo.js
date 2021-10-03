import React from 'react'

export default function ContactInfo(props) {

    return (
        <div className="container mt-4 mb-4 p-3 d-flex justify-content-center">
          
                <div className=" image d-flex flex-column justify-content-center align-items-center"> 
                    <button className="btn btn-secondary"> <img src="https://i.imgur.com/wvxPV9S.png" alt="" height="100" width="100" /></button> 
                    <span className="name mt-3">{props.contactInfo.email}</span> <span className="idd"></span>
                    <div className="d-flex flex-row justify-content-center align-items-center gap-2"> <span className="idd1">{props.contactInfo.phone}</span> <span><i className="fa fa-copy"></i></span> </div>
                    <div className="d-flex flex-row justify-content-center align-items-center mt-3">{props.contactInfo.street_address}</div>
                    <div className="text mt-3"> <span>{props.contactInfo.state}<br/><br/>{props.contactInfo.zip}</span> </div>
                    </div>
               
            </div>
    )
}
