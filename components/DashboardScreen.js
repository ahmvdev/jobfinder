import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Card, Title, Paragraph } from 'react-native-paper';
import { LineChart } from 'react-native-chart-kit';

const DashboardScreen = () => {
  return (
    <View style={styles.container}>
      <View style={styles.cardContainer}>
        <Card style={styles.card}>
          <Card.Content>
            <Title>Jobs Clicked</Title>
            <Paragraph>10</Paragraph>
          </Card.Content>
        </Card>

        <Card style={styles.card}>
          <Card.Content>
            <Title>Jobs Saved</Title>
            <Paragraph>5</Paragraph>
          </Card.Content>
        </Card>
      </View>

      <View style={styles.chartContainer}>
        <LineChart
          data={{
            labels: ['Jobs Clicked', 'Jobs Saved'],
            datasets: [
              {
                data: [10, 5],
              },
            ],
          }}
          width={400}
          height={250}
          yAxisLabel="" // Set yAxisLabel to an empty string
          chartConfig={{
            backgroundGradientFrom: '#fff',
            backgroundGradientTo: '#fff',
            color: (opacity = 1) => `rgba(0, 122, 255, ${opacity})`, // Light blue color
            labelColor: (opacity = 1) => `rgba(0, 0, 0, ${opacity})`,
            style: {
              borderRadius: 16,
            },
            propsForDots: {
              r: '6',
              strokeWidth: '2',
              stroke: '#007AFF', // Dot color
            },
          }}
          bezier
          style={styles.chart}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    justifyContent: 'space-evenly',
  },
  cardContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  card: {
    flex: 1,
    marginBottom: 16,
    elevation: 4,
  },
  chartContainer: {
    alignItems: 'center',
  },
  chart: {
    marginVertical: 8,
    borderRadius: 16,
  },
});

export default DashboardScreen;
