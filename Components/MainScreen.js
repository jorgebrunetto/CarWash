import React, { Component } from "react";
import {
    StyleSheet,
    Platform
} from "react-native";

import MapTab from './AppTabNavigator/MapTab'
import ListTab from './AppTabNavigator/ListTab'
import RageTab from './AppTabNavigator/RageTab'
import NotifyTab from './AppTabNavigator/NotifyTab'
import ProfileTab from './AppTabNavigator/ProfileTab'

import { createBottomTabNavigator } from 'react-navigation'
import Icon from 'react-native-vector-icons/MaterialCommunityIcons'


class MainScreen extends Component {

    static navigationOptions = {
        headerLeft: <Icon name="chevron-left" color={'#53c2fa'} size={32} style={{ paddingLeft: 10 }} />,
        title: "Instagram",
        headerRight: <Icon name="settings" color={'#53c2fa'} size={24} style={{ paddingRight: 10 }} />,
        headerStyle: {
            borderBottomColor: '#53c2fa',
            borderBottomWidth: 2,
        }
    }

    render() {
        return (
            <AppTabNavigator />
        );
    }
}
export default MainScreen;

const AppTabNavigator = createBottomTabNavigator(
    {
        MapTab: {
            screen: MapTab,
            navigationOptions: {
                tabBarIcon: ({ tintColor }) => (
                    <Icon size={24} style={{ color: tintColor }} name="map-marker-outline" />
                ),
            }
        },
        ListTab: {
            screen: ListTab,
            navigationOptions: {
                tabBarIcon: ({ tintColor }) => (
                    <Icon size={24} style={{ color: tintColor }} name="view-list" />
                ),
            }
        },
        RageTab: {
            screen: RageTab,
            navigationOptions: {
                tabBarIcon: ({ tintColor }) => (
                    <Icon size={32} style={{ color: tintColor }} name="target" />
                ),
            }
        },
        NotifyTab: {
            screen: NotifyTab,
            navigationOptions: {
                tabBarIcon: ({ tintColor }) => (
                    <Icon size={24} style={{ color: tintColor }} name="email-outline" />
                ),
            }
        },
        ProfileTab: {
            screen: ProfileTab,
            navigationOptions: {
                tabBarIcon: ({ tintColor }) => (
                    <Icon size={24} style={{ color: tintColor }} name="account-outline" />
                ),
            }
        },

    }, {
        tabBarOptions: {
            showLabel: false,
            style: {
                backgroundColor: '#53c2fa',
                borderTopWidth: 0,
            },
            initialRouteName: 'HomeTab',
            activeTintColor: '#f85679',
            inactiveTintColor: '#fff',
        }
    }
)