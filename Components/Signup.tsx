import { View, Text, StyleSheet, Alert, TouchableOpacity } from 'react-native'
import React from 'react'
import Background from './Background'
import { darkGreen } from "./constants";
import Field from './Field';
import Btn from './Btn';

const SignUp = (props) => {
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
                    marginTop:20,
                }}> Register</Text>
                <Text 
                  style={{
                    color:'white',
                    fontSize:64,
                    marginBottom:20,
                    fontWeight:'bold'
                  }}
                >Create a new account</Text>
                <View
                    style={{
                        backgroundColor: 'white',
                        height: 700,
                        width: 460,
                        borderTopLeftRadius: 130,
                        paddingTop: 50,
                        alignItems: 'center'
                    }}
                >
                    <Text style={{
                        fontSize: 40,
                        color: darkGreen,
                        fontWeight: 'bold'
                    }}>Register</Text>
                    <Text style={{
                        color: 'grey',
                        fontSize: 19,
                        fontWeight: 'bold',
                        marginBottom: 20
                    }}>Login to your account</Text>
                    <Field placeholder="Name"/>
                    <Field placeholder="Contact nummber" keyboardType="number"/>
                    <Field placeholder="Email / Username" keyboardType="email-address" />
                    <Field placeholder="Password" secureTextEntry={true} />
                    <Field placeholder="Confirm Password" secureTextEntry={true} />

                   <View
                        style={{
                            display:"flex",
                            flexDirection:"row",
                            width: "80%", 
                            paddingRignt: 16,
                            marginBottom:200
                }}>
                    <Text style={{
                        color: "#414141",
                        fontSize: 16,

                    }}>By signing up, you agree to our</Text>
                    <Text style={{
                        color: darkGreen,
                        fontWeight: 'bold',
                        fontSize:16
                    }}>Terms and Conditions</Text>
                </View>
                <View
                        style={{
                            display:"flex",
                            justifyContent:"center",
                            flexDirection:"row",
                            width: "80%", 
                            paddingRignt: 16,
                            
                }}>
                    <Text style={{
                        color: "#414141",
                        fontSize: 16,

                    }}>and</Text>
                    <Text style={{
                        color: darkGreen,
                        fontWeight: 'bold',
                        fontSize:16
                    }}>Privacy Policy</Text>
                </View>
                <Btn textColor='white' bgColour={darkGreen} btnLabel="Signup" Press={() => Alert("Account created")}/>
            </View>
            <View
                style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center'

                }}
            >
                <Text style={{fontSize:16, fontWeight:"bold"}}>Already have an accout?</Text>
                <TouchableOpacity onPress={()=>props.navigation.navigate("Login")}>
                    <Text style={{color:darkGreen, fontWeight:'bold', fontSize:16  }}>Login</Text>
                </TouchableOpacity>

            </View>
        </View>
    </Background >
  )
}

export default SignUp