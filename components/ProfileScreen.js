import React, { useState } from 'react';
import { View, Image, Button, Text } from 'react-native';
import { IconButton, TextInput as PaperTextInput } from 'react-native-paper';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useNavigation } from '@react-navigation/native';

const ProfileScreen = () => {
  const navigation = useNavigation();

  const [name, setName] = useState('Ahmad Saeed');
  const [email, setEmail] = useState('ahmad@gmail.com');
  const [phone, setPhone] = useState('');
  const [profileImage, setProfileImage] = useState(require('../assets/profile.jpg'));
  const [editMode, setEditMode] = useState(false);

  const handleEditToggle = () => {
    setEditMode(!editMode);
  };

  const handleLogout = async () => {
    try {
      console.log('Logging out...');

      // Remove the token from AsyncStorage
      await AsyncStorage.removeItem('token');
      console.log('Token removed.');

      // Navigate to the login screen
      navigation.reset({
        index: 0,
        routes: [{ name: 'LoginScreen' }],
      });
    } catch (error) {
      console.error('Logout error:', error);
    }
  };

  const renderTextInputs = () => {
    return (
      <>
        <PaperTextInput
          label="Name"
          value={name}
          onChangeText={(text) => setName(text)}
          disabled={!editMode}
          style={{
            marginVertical: 10,
            backgroundColor: 'white',
            borderBottomColor: editMode ? '#042a4a' : 'transparent',
            borderBottomWidth: editMode ? 2 : 0,
          }}
        />

        <PaperTextInput
          label="Email"
          value={email}
          onChangeText={(text) => setEmail(text)}
          disabled={!editMode}
          style={{
            marginVertical: 10,
            backgroundColor: 'white',
            borderBottomColor: editMode ? '#042a4a' : 'transparent',
            borderBottomWidth: editMode ? 2 : 0,
          }}
        />

        <PaperTextInput
          label="Phone"
          value={phone}
          onChangeText={(text) => setPhone(text)}
          disabled={!editMode}
          style={{
            marginVertical: 10,
            backgroundColor: 'white',
            borderBottomColor: editMode ? '#042a4a' : 'transparent',
            borderBottomWidth: editMode ? 2 : 0,
          }}
        />
      </>
    );
  };

  return (
    <View>
      <View>
        <Image source={profileImage} style={{ width: 80, height: 80, borderRadius: 40 }} />
      </View>

      <View style={{ flexDirection: 'row', alignItems: 'center' }}>
        <IconButton
          icon="logout"
          onPress={handleLogout}
          color="#042a4a"
        />
        <Text style={{ marginLeft: 10, fontSize: 16, color: '#042a4a' }}>
          Logout
        </Text>
      </View>

      <View>
        {renderTextInputs()}
      </View>

      <View>
        <Button
          title={editMode ? 'Done' : 'Edit'}
          onPress={handleEditToggle}
          color="#042a4a"
        />
      </View>

      {editMode && (
        <View>
          <Button
            title="Save Changes"
            onPress={handleEditToggle}
            color="#042a4a"
          />
        </View>
      )}

      <Text style={{ fontSize: 20, fontWeight: 'bold', marginTop: 20 }}>
        Saved Jobs
      </Text>

      <Text>
        No jobs saved
      </Text>
    </View>
  );
};

export default ProfileScreen;
