import { TextInput, TextInputProps } from 'react-native'
import React from 'react'
import { darkGreen } from './constants'

const Field = (props: React.JSX.IntrinsicAttributes & React.JSX.IntrinsicClassAttributes<TextInput> & Readonly<TextInputProps>) => {
  return (
   <TextInput {...props} style={{
    borderRadius:100,
    color:darkGreen,
    paddingHorizontal:10,
    width: '80%', 
    backgroundColor:'rgb(220, 220, 220)'
   }}placeholderTextColor="#006A42">
        
   </TextInput>
  )
}

export default Field