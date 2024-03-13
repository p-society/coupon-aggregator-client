import * as React from 'react';
import { View, Text } from 'react-native';
import { NativeStackNavigationOptions } from '@react-navigation/native-stack';
import { RouteProp } from '@react-navigation/native';
import { ParamListBase } from '@react-navigation/native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Home from './Components/Home';
import Signup from './Components/Signup';
import Login from './Components/Login';

function HomeScreen() {
  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Home Screen</Text>
    </View>
  );
}

const Stack = createNativeStackNavigator();
const screenOptions = ({ route }: { route: RouteProp<ParamListBase, string> }): NativeStackNavigationOptions => ({
  headerShown: false,
  // other options
});
function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen name="Signup" component={Signup} />
        <Stack.Screen name="Login" component={Login} />
        
      </Stack.Navigator>
    </NavigationContainer>
  );
}
export default App;