import React, { useState } from 'react';
import { View, TextInput, TouchableOpacity, Image, Text, StyleSheet } from 'react-native';
import axios from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

export default function SignupScreen({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');

  const handleSignup = () => {
    console.log('Email:', email);
    console.log('Password:', password);
    console.log('First Name:', firstName);
    console.log('Last Name:', lastName);

    axios
      .post('http://localhost:8000/api/signup/', {
        email,
        password,
        first_name: firstName,
        last_name: lastName,
      })
      .then(async (response) => {
        const token = response.data.token;
        await AsyncStorage.setItem('token', token);
        navigation.navigate('LoginScreen');
      })
      .catch((error) => {
        console.error('Signup error:', error);
      });
  };

  return (
    <View style={styles.container}>
      {/* Logo Section */}
      <View style={styles.logoContainer}>
        {/* Replace 'logo.png' with the path to your logo image */}
        <Image source={require('../assets/logo.png')} style={styles.logo} />
      </View>

      {/* Signup Title */}
      <Text style={styles.loginTitle}>Signup</Text>

      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={(text) => setEmail(text)}
      />
      <TextInput
        style={styles.input}
        placeholder="Password"
        value={password}
        onChangeText={(text) => setPassword(text)}
        secureTextEntry
      />
      <TextInput
        style={styles.input}
        placeholder="First Name"
        value={firstName}
        onChangeText={(text) => setFirstName(text)}
      />
      <TextInput
        style={styles.input}
        placeholder="Last Name"
        value={lastName}
        onChangeText={(text) => setLastName(text)}
      />
      <TouchableOpacity onPress={handleSignup} style={styles.signupButton}>
        <Text style={styles.buttonText}>Signup</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'center',
    padding: 20,
    marginTop: 30, // Adjusted marginTop to move the content a bit above
  },
  logoContainer: {
    marginBottom: 10, // Adjusted marginBottom for the logo
  },
  logo: {
    width: 150,
    height: 150,
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
  signupButton: {
    backgroundColor: '#042a4a',
    borderRadius: 8,
    height: 40,
    width: 92,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 20,
  },
  buttonText: {
    color: '#ffffff',
    fontFamily: 'Arial',
    fontSize: 13.3333,
    lineHeight: 16,
    textAlign: 'center',
    letterSpacing: 0.25,
  },
});
