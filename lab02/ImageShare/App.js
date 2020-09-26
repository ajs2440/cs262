import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { StyleSheet, Text, View, TextInput, Button, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState('John Doe');
  const [age, setAge] = useState(0);

  const [birthdays, setBirthdays] = useState([]);

  const clickHandler = () => {
    const newAge = age + 1;
    setAge(newAge);
    setBirthdays(
      birthdays.concat({ key: newAge.toString() })
    );
  }

  return (
    <View style={styles.container}>
      <Text>Enter name:</Text>
      <TextInput
        style={styles.input}
        placeholder='e.g. John Doe'
        onChangeText={(val) => setName(val)} />

      <Text>{name} is {age} years old.</Text>
      <View style={styles.buttonContainer}>
        <Button title='BIRTHDAY' onPress={clickHandler} />
      </View>

      <FlatList
        data={birthdays}
        renderItem={({ item }) => (
          <Text style={styles.item}>{item.key}</Text>
        )}
      />
    </View >
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 100
  },
  buttonContainer: {
    marginTop: 20
  },
  input: {
    borderWidth: 1,
    borderColor: '#777',
    padding: 8,
    margin: 10,
    width: 200,
  },
  item: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  }
});
