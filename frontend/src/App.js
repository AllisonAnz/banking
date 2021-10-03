
import React, { Component } from 'react'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'
import Navigation from './components/Navigation'
import Home from './components/Home'
import Clients from './components/Clients'
import ClientContainer from './components/ClientContainer'
import AddNewClient from './components/ContainerComponents/AddNewClient'

export class App extends Component {
  render() {
    return (
        <Router>
          <Navigation/>
          <div className="App">
            <Switch>
              <Route exact path="/" component={Home}/>
              <Route exact path="/clients" component={Clients} /> 
              <Route exact path="/clients/:id" component={ClientContainer} />
              <Route exact path="/addNew" component={AddNewClient}/>
            </Switch>
          </div>
        </Router>
    
    )
  }
}

export default App


