import { View, Text, StyleSheet, Alert, TouchableOpacity } from 'react-native'
import React from 'react'
import Background from './Background'
import { darkGreen } from "./constants";
import Field from './Field';
import Btn from './Btn';

const Login = (props: { navigation: { navigate: (arg0: string) => void; }; }) => {
    function AlertStatic(arg0: string) {
        throw new Error('Function not implemented.');
    }

    return (
        <Background>
            <View style={{
                alignItems: 'center',
                width: 400,
            }}>
                <Text style={{
                    color: 'white',
                    fontSize: 64,
                    fontWeight: 'bold',
                    marginVertical: 10,
                }}> Login</Text>
                <View
                    style={{
                        backgroundColor: 'white',
                        height: 700,
                        width: 460,
                        borderTopLeftRadius: 130,
                        paddingTop: 100,
                        alignItems: 'center'
                    }}
                >
                    <Text style={{
                        fontSize: 40,
                        color: darkGreen,
                        fontWeight: 'bold'
                    }}>Welcome back</Text>
                    <Text style={{
                        color: 'grey',
                        fontSize: 19,
                        fontWeight: 'bold',
                        marginBottom: 20
                    }}>Login to your account</Text>
                    <Field placeholder="Email / Username" keyboardType="email-address" />
                    <Field placeholder="Password" secureTextEntry />

                    <View
                        style={{
                            alignItems: 'flex-end',
                            width: '80%',
                            marginBottom: 200
                        }}>
                        <Text style={{
                            color: darkGreen,
                            fontWeight: 'bold',

                        }}>Forgot Password?</Text>
                    </View>
                    <Btn textColor='white' bgColour={darkGreen} btnLabel="Login" Press={() => AlertStatic("Logged in")} />
                </View>
                <View
                    style={{
                        display: 'flex',
                        flexDirection: 'row',
                        justifyContent: 'center'

                    }}
                >
                    <Text style={{ fontSize: 16, fontWeight: "bold" }}>Don't have an account?</Text>
                    <TouchableOpacity onPress={() => props.navigation.navigate("Signup")}>
                        <Text style={{ color: darkGreen, fontWeight: 'bold', fontSize: 16 }}>Signup</Text>
                    </TouchableOpacity>

                </View>
            </View>
        </Background>
    )
}

export default Login
