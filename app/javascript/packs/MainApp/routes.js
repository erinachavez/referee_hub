import React from 'react'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import HomePage from './components/HomePage'
import Referees from './components/Referees'
import RefereeProfile from './components/RefereeProfile'

const App = () => (
  <Router>
    <div>
      <Route exact path='/' component={HomePage} />
      <Route exact path='/referees' component={Referees} />
      <Route path='/referees/:id' component={RefereeProfile} />
    </div>
  </Router>
)

export default App
