import React, { Component } from "react";
import { 
    View,
    Text,
    StyleSheet
} from "react-native";

class RageTab extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>RageTab</Text>
            </View>
        );
    }
}
export default RageTab;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    }
});