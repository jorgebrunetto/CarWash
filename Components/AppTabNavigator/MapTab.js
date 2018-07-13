import React, { Component } from "react";
import { 
    View,
    Text,
    StyleSheet
} from "react-native";

class MapTab extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>MapTab</Text>
            </View>
        );
    }
}
export default MapTab;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    }
});