import React, { Component } from "react";
import { 
    View,
    Text,
    StyleSheet
} from "react-native";

class ListTab extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>ListTab</Text>
            </View>
        );
    }
}
export default ListTab;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    }
});