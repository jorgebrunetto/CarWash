import React, { Component } from "react";
import {
    View,
    Text,
    StyleSheet,
    TouchableHighlight,
    Image
} from "react-native";

class LoginTab extends Component {
    onPress = () => {
        Alert.alert('Oi Teste');
    }
    render() {
        return (
            <View style={styles.container}>
                <Image
                    resizeMode={'contain'}
                    style={{ width: '100%', zIndex: 1, position: 'absolute', justifyContent: 'flex-end' }}
                    source={require('../../assets/img/bg.png')}
                />
                <Image
                    resizeMode={'contain'}
                    style={{ width: 220, zIndex: 1, top: 80, position: 'absolute' }}
                    source={require('../../assets/img/carwashlogo.png')}
                />

                <View style={styles.scrollInner}>
                    <TouchableHighlight
                        style={[styles.btn, styles.btnBlue]}
                        onPress={this.onPress}
                        underlayColor={'transparent'}>
                        <Text style={[styles.innerBtn, styles.colorBlue]}>
                            {'entrar com facebook'.toUpperCase()}
                        </Text>
                    </TouchableHighlight>

                    <View style={styles.mH25}>
                        <Text
                            style={{
                                alignSelf: 'center',
                                paddingHorizontal: 5,
                                backgroundColor: 'white',
                                zIndex: 1,
                                color: '#c3c3c3',
                            }}>
                            OU
                        </Text>
                        <View
                            style={{
                                alignSelf: 'center',
                                position: 'absolute',
                                borderBottomWidth: 1,
                                borderBottomColor: '#c3c3c3',
                                height: '50%',
                                width: '65%',
                            }}
                        />
                    </View>

                    <TouchableHighlight
                        style={[styles.btn, styles.btnGreen]}
                        onPress={this.onPress}
                        underlayColor={'transparent'}>
                        <Text style={[styles.innerBtn, styles.colorGreen]}>
                            {'já tenho uma conta'.toUpperCase()}
                        </Text>
                    </TouchableHighlight>
                </View>
            </View>
        );
    }
}
export default LoginTab;

var blueColor = '#3B5999',
    greenColor = '#2cf2c3';
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center'
    },
    scrollInner: {
        zIndex: 2,
    },
    mH25: {
        marginVertical: 25,
    },
    innerBtn: {
        fontSize: 15,
    },
    colorBlue: {
        color: blueColor,
    },
    colorGreen: {
        color: greenColor,
    },
    btn: {
        shadowOffset: { height: 5 },
        shadowRadius: 5,
        shadowOpacity: 0.35,
        justifyContent: 'center',
        alignItems: 'center',
        width: 260,
        paddingVertical: 15,
        backgroundColor: '#fff',
        borderRadius: 50,
        borderWidth: 2,
    },
    btnBlue: {
        shadowColor: blueColor,
        borderColor: blueColor,
    },
    btnGreen: {
        shadowColor: greenColor,
        borderColor: greenColor,
    },
});