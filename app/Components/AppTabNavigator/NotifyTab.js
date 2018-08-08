import React, { Component } from "react";
import { 
    View,
    Text,
    StyleSheet
} from "react-native";

class NotifyTab extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>NotifyTab</Text>
            </View>
        );
    }
}
export default NotifyTab;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    }
});