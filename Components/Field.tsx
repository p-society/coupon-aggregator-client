import { TextInput } from 'react-native'
import React from 'react'
import { darkGreen } from './constants'

const Field = (props) => {
  return (
   <TextInput {props} style={{
    borderRadius:100,
    color:darkGreen,
    paddingHorizontal:10,
    width:80%,
    placeholderTextColor:{darkGreen},
    backgroundColor:'rgb(220, 220, 220)'
   }}>
        
   </TextInput>
  )
}

export default Field