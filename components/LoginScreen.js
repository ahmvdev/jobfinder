import React, { useState } from 'react';
import { View, Text, TextInput, StyleSheet, Image } from 'react-native';
import { Button } from 'react-native-paper';
import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginScreen = ({ navigation }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async () => {
    try {
      console.log('Attempting login...');

      const response = await axios.post('http://localhost:8000/api/login/', {
        email,
        password,
      });

      console.log('Response data:', response.data);

      const token = response.data.token;

      await AsyncStorage.setItem('token', token);

      console.log('Token:', token);

      navigation.navigate('MainScreen');
    } catch (error) {
      console.error('Login error:', error);

      console.error(error);
    }
  };

  const goToSignup = () => {
    navigation.navigate('Signup');
  };

  return (
    <View style={styles.container}>
      {/* Logo Section */}
      <View style={styles.logoContainer}>
        {/* Replace 'logo.png' with the path to your logo image */}
        <Image source={require('../assets/logo.png')} style={styles.logo} />
      </View>

      {/* Login Title */}
      <Text style={styles.loginTitle}>Login</Text>

      {/* Input Fields */}
      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={(text) => setEmail(text)}
      />
      <TextInput
        style={styles.input}
        placeholder="Password"
        secureTextEntry
        value={password}
        onChangeText={(text) => setPassword(text)}
      />

      {/* Button Container */}
      <View style={styles.buttonContainer}>
        <Button
          mode="contained"
          onPress={handleLogin}
          style={[styles.button, styles.loginButton]}
        >
          Login
        </Button>
        <Button
          mode="contained"
          onPress={goToSignup}
          style={[styles.button, styles.signupButton]}
        >
          Signup
        </Button>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'center',
    padding: 20,
    marginTop: 50,
  },
  logoContainer: {
    marginBottom: 20,
  },
  logo: {
    width: 150, // Adjust the width as needed
    height: 150, // Adjust the height as needed
    resizeMode: 'contain',
  },
  loginTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
    alignSelf: 'flex-start',
  },
  input: {
    width: '100%',
    height: 40,
    marginVertical: 10,
    padding: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#042a4a',
  },
  buttonContainer: {
    flexDirection: 'row',
    marginTop: 20,
  },
  button: {
    marginHorizontal: 10,
    borderRadius: 8,
    height: 44,
    width: 94,
    justifyContent: 'center',
    alignItems: 'center',
    fontFamily: 'Noto Sans, "Helvetica Neue", Helvetica, Arial, sans-serif',
    fontSize: 14,
    lineHeight: 18,
    textAlign: 'center',
    letterSpacing: 'normal',
    boxShadow: 'none',
  },
  loginButton: {
    backgroundColor: '#042a4a',
    color: '#ffffff',
  },
  signupButton: {
    backgroundColor: '#042a4a',
    color: '#ffffff',
  },
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'center',
    padding: 20,
    marginTop: 50,
    backgroundColor: 'white', // Set the background color to white
  },
});

export default LoginScreen;