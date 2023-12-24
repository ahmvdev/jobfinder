import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import OnboardScreen from './components/OnBoardScreen';
import LoginScreen from './components/LoginScreen';
import SignupScreen from './components/SignupScreen';
import MainScreen from './components/MainScreen';
import ProfileScreen from './components/ProfileScreen';
import DashboardScreen from './components/DashboardScreen';

import FontAwesome from 'react-native-vector-icons/FontAwesome'; // You can use any icon library you prefer

const Stack = createStackNavigator();
const Tab = createBottomTabNavigator();

const Tab2Icon = ({ color, size }) => (
  <FontAwesome name="dashboard" color={color} size={size} />
);

const Tab3Icon = ({ color, size }) => (
  <FontAwesome name="user" color={color} size={size} />
);

function Tab2Screen() {
  return (
    <DashboardScreen />
  );
}

function Tab3Screen() {
  return (
    <ProfileScreen />
  );
}

function MainTabNavigator() {
  return (
    <Tab.Navigator
            tabBarOptions={{
      activeTintColor: '#042a4a',
    }}>
      <Tab.Screen
        name="Home"
        component={MainScreen}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size }) => (
            <FontAwesome name="home" color={color} size={size} />
          ),
        }}
      />
      <Tab.Screen
        name="Dash"
        component={Tab2Screen}
        options={{
          headerShown: false,
          tabBarIcon: Tab2Icon,
        }}
      />
      <Tab.Screen
        name="Profile"
        component={Tab3Screen}
        options={{
          headerShown: false,
          tabBarIcon: Tab3Icon,
        }}
      />
    </Tab.Navigator>
  );
}

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="OnboardScreen">
        <Stack.Screen
          name="OnboardScreen"
          component={OnboardScreen}
          options={{ headerShown: false }}
        />
<Stack.Screen
  name="LoginScreen"
  component={LoginScreen}
  options={{
    title: '',
    headerShown: false, // Ensure the header is hidden
    cardStyle: { backgroundColor: 'white' }, // Set the background color to white
  }}
/>

<Stack.Screen
  name="Signup"
  component={SignupScreen}
  options={{
    title: '',
    headerShown: false, // Ensure the header is hidden
    cardStyle: { backgroundColor: 'white' }, // Set the background color to white
  }}
/>

        <Stack.Screen
          name="MainScreen"
          component={MainTabNavigator}
          options={{ headerShown: false }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
