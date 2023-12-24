import React from 'react';
import { View, Text, StyleSheet, Image } from 'react-native';
import AppIntroSlider from 'react-native-app-intro-slider';
import { useNavigation } from '@react-navigation/native';

const onboardData = [
  {
    key: '1',
    title: 'Welcome to Job Finder',
    text: 'Discover job opportunities that match your skills and interests.',
    image: require('../assets/ob.png'),
  },
  {
    key: '2',
    title: 'Getting Started',
    text: 'Explore a variety of scholarships to support your educational journey.',
    image: require('../assets/ob2.png'),
  },
  {
    key: '3',
    title: 'Set Up Your Profile',
    text: 'Create a personalized profile to showcase your qualifications and experiences.',
    image: require('../assets/ob3.png'),
  },
];

const OnBoardScreen = () => {
  const navigation = useNavigation();

  const renderItem = ({ item }) => (
    <View style={styles.slide}>
      <Image source={item.image} style={styles.image} />
      <Text style={styles.title}>{item.title}</Text>
      <Text style={styles.text}>{item.text}</Text>
    </View>
  );

  return (
    <AppIntroSlider
      renderItem={renderItem}
      data={onboardData}
      onDone={() => navigation.reset({ index: 0, routes: [{ name: 'LoginScreen' }] })}
      showNextButton={false} // Hide the Next button
      showDoneButton={true}
      activeDotStyle={{ backgroundColor: 'navy' }}
      buttonTextStyle={{ color: 'navy' }}
      doneLabel={<Text style={styles.buttonText}>Done</Text>}
      doneStyle={styles.button}
    />
  );
};

const styles = StyleSheet.create({
  slide: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  image: {
    width: 300,
    height: 300,
    marginBottom: 40,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  text: {
    fontSize: 16,
    textAlign: 'center',
    paddingHorizontal: 30,
  },
  buttonText: {
    color: 'navy',
  },
  button: {
    backgroundColor: 'transparent',
  },
});

export default OnBoardScreen;
