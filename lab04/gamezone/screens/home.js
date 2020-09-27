import React, { useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';

export default function Home({ navigation }) {
    const [reviews, setReviews] = useState([
        { title: 'Am I talking to me?', rating: 10, body: 'Yes you are.', key: '1' },
        { title: 'Dang I\'m lonely.', rating: 10, body: 'Yes you are.', key: '2' },
        { title: 'This is so sad, Despacito play Alexa.', rating: 10, body: 'Yes you are.', key: '3' },
    ]);

    return (
        <View style={globalStyles.container}>
            <FlatList data={reviews} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Text style={globalStyles.titleText}>{item.title}</Text>
                </TouchableOpacity>
            )} />
        </View>
    );
}
