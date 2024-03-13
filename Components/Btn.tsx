import { StyleSheet, Text, Touchable, TouchableOpacity, View } from 'react-native'
import React from 'react'

export default function Btn({bgColour, btnLabel, textColor, Press}) {
  return (
    <TouchableOpacity
        onPress={Press}
        style={{
            
            backgroundColor:bgColour,
            borderRadius:100,
            alignItems:'center',
            width:350,
            paddingVertical:5,
            marginVertical:10,
                
        }}
    >
        <Text style={{color:textColor, fontSize:25, fontWeight:'bold'}}>{btnLabel}</Text>
    </TouchableOpacity>
  )
}

