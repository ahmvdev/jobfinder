import React, { useEffect, useState } from 'react';
import { View, Text, Button, TextInput, StyleSheet, Linking, Picker, ScrollView, Image, TouchableOpacity } from 'react-native';
import axios from 'axios';

const MainScreen = ({ navigation }) => {
  const [mainJobs, setMainJobs] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [filteredJobs, setFilteredJobs] = useState([]);
  const [filterProfession, setFilterProfession] = useState('All');
  const [filterLocation, setFilterLocation] = useState('All');
  const [filterSalary, setFilterSalary] = useState('');

  const [isFilterVisible, setFilterVisible] = useState(false);

  useEffect(() => {
    axios.get('http://127.0.0.1:8000/api/mainjobs/')
      .then((response) => setMainJobs(response.data))
      .catch((error) => console.error('Error fetching data:', error));
  }, []);

  useEffect(() => {
    const filtered = mainJobs.filter((job) => {
      const jobMatchesSearch = (
        job.job_title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        job.job_description.toLowerCase().includes(searchQuery.toLowerCase()) ||
        job.company.toLowerCase().includes(searchQuery.toLowerCase())
      );
      const jobMatchesProfession = (
        filterProfession === 'All' || job.category.toLowerCase().includes(filterProfession.toLowerCase())
      );
      const jobMatchesLocation = (
        filterLocation === 'All' || job.location.toLowerCase().includes(filterLocation.toLowerCase())
      );
      const jobMatchesSalary = (
        filterSalary === '' || (typeof job.salary === 'number' && job.salary >= parseFloat(filterSalary))
      );
      return jobMatchesSearch && jobMatchesProfession && jobMatchesLocation && jobMatchesSalary;
    });
    setFilteredJobs(filtered);
  }, [searchQuery, mainJobs, filterProfession, filterLocation, filterSalary]);

  const handleApply = (url) => Linking.openURL(url);

  const toggleFilter = () => {
    setFilterVisible(!isFilterVisible);
  };

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Image source={require('../assets/logo.png')} style={styles.logoImage} />
        <TextInput
          placeholder="Search jobs..."
          value={searchQuery}
          onChangeText={(text) => setSearchQuery(text)}
          style={styles.filterSalaryInput}
        />
        <TouchableOpacity style={styles.filterIcon} onPress={toggleFilter}>
          <Text style={styles.filterIconText}>Filter</Text>
        </TouchableOpacity>
      </View>
      <Text style={styles.jobFeedText}>Job Feed</Text>

      {isFilterVisible && (
        <View style={styles.filters}>
          <Picker selectedValue={filterProfession} onValueChange={itemValue => setFilterProfession(itemValue)} style={styles.filterPicker}>
            <Picker.Item label="All Professions" value="All" />
          </Picker>
          <Picker selectedValue={filterLocation} onValueChange={itemValue => setFilterLocation(itemValue)} style={styles.filterPicker}>
            <Picker.Item label="All Locations" value="All" />
            <Picker.Item label="Punjab" value="Punjab" />
            <Picker.Item label="Sindh" value="Sindh" />
            <Picker.Item label="Khyber Pakhtunkhwa" value="Khyber Pakhtunkhwa" />
            <Picker.Item label="Balochistan" value="Balochistan" />
            <Picker.Item label="Gilgit-Baltistan" value="Gilgit-Baltistan" />
          </Picker>
          <TextInput placeholder="Minimum Salary" value={filterSalary} onChangeText={text => setFilterSalary(text)} style={styles.filterSalaryInput} keyboardType="numeric" />
        </View>
      )}
      <ScrollView style={styles.jobList}>
        <View>
          {filteredJobs.map((job, index) => (
            <View key={job.job_id} style={styles.jobContainer}>
              <Text style={styles.jobTitle}>{job.job_title}</Text>
              <Text style={styles.company}>Company: {job.company}</Text>
              <Text style={styles.location}>Location: {job.location}</Text>
              <Text style={styles.salary}>Salary: ${typeof job.salary === 'number' ? job.salary.toFixed(2) : 'N/A'}</Text>
              <Button title="Apply Now" onPress={() => handleApply(job.url)} color="#042a4a" />
              {index < filteredJobs.length - 1 && <View style={styles.divider} />}
            </View>
          ))}
        </View>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 16,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
  },
  logoImage: {
    width: 160,
    height: 40,
  },
  filterIcon: {
    backgroundColor: '#042a4a',
    padding: 10,
    borderRadius: 4,
    alignItems: 'center',
    marginLeft: 10,
  },
  filterIconText: {
    color: 'white',
    fontWeight: 'bold',
  },
  filters: {
    backgroundColor: '#fff',
    padding: 16,
  },
  filterPicker: {
    height: 60,
    backgroundColor: '#ffffff',
    borderColor: 'transparent',
    borderWidth: 0,
    borderRadius: 8,
    paddingHorizontal: 16,
    marginVertical: 12,
    fontSize: 14,
    lineHeight: 20.02,
    color: '#000000',
    textAlign: 'start',
    letterSpacing: 'normal',
  },
  filterSalaryInput: {
    height: 60,
    backgroundColor: '#ffffff',
    borderColor: 'transparent',
    borderWidth: 0,
    borderRadius: 8,
    padding: 16,
    marginVertical: 12,
    fontSize: 14,
    lineHeight: 20.02,
    color: '#000000',
    textAlign: 'start',
    letterSpacing: 'normal',
  },
  jobList: {
    marginTop: 10,
  },
  jobContainer: {
    backgroundColor: '#ffffff',
    borderColor: 'transparent',
    borderWidth: 0,
    borderRadius: 8,
    marginVertical: 12,
    padding: 16,
  },
  jobTitle: {
    fontSize: 14,
    lineHeight: 20.02,
    color: '#000000',
    textAlign: 'start',
    letterSpacing: 'normal',
    marginBottom: 0,
  },
  salary: {
    fontSize: 14,
    lineHeight: 20.02,
    color: '#008000',
    textAlign: 'start',
    letterSpacing: 'normal',
    marginBottom: 8,
  },
  applyButton: {
    color: '#042a4a',
  },
  jobFeedText: {
    fontWeight: 'bold',
    fontSize: 20, // You can adjust the font size
    color: '#000000', // You can adjust the color
    marginTop: 10,
    marginLeft: 20, // Add margin to separate it from the header
  },
  
});

export default MainScreen;
