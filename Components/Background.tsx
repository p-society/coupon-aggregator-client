import { View, Text, ImageBackground } from 'react-native'
import React from 'react'
import { Children } from 'react';

const Background = (props: any) => {
  return (
    <View>
     <ImageBackground source={require("C:\Users\Samarth\native\couponAggregatorClient\Components\meal.jpg")}
     style={{height:'100%'}}
     />
     <View style={{position:"absolute"}}></View>
    </View>
  )
}

export default Background