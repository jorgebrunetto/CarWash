import React, { Component } from "react";
import { 
    View,
    Text,
    StyleSheet
} from "react-native";

class ProfileTab extends Component {
    render() {
        return (
            <View style={styles.container}>
                <Text>ProfileTab</Text>
            </View>
        );
    }
}
export default ProfileTab;

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    }
});