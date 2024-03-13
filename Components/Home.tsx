import { View, Text, StyleSheet } from 'react-native'
import React from 'react'
import Background from './Background'
import Btn from './Btn'
import { darkGreen, green } from './constants'

const Home = (props: { navigation: { navigate: (arg0: string) => any } }) => {
  return (
    <Background>
        <View
            style={{
                marginHorizontal:40,
                marginVertical:100
            }}
        >
            <Text style={{color:'white', fontSize:64}}>Let's eat</Text>
            <Text style={{color:'white', fontSize:64}}>in mess</Text>
        </View>
        <Btn bgColour={green} textColor='white' btnLabel="Login" Press={()=>props.navigation.navigate("Login")} />
        <Btn bgColour='white' textColor={darkGreen} btnLabel="SignUp" Press={()=>props.navigation.navigate("Signup")} />
    </Background>
  )
}

export default Home