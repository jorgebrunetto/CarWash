import React, { Component } from 'react'

import { createStackNavigator } from 'react-navigation'

import MainScreen from './Components/MainScreen'

export default class App extends Component {
  render() {
    return (
      <Navegacao />
    );
  }
}

const Navegacao = createStackNavigator({
  Main: MainScreen,
})