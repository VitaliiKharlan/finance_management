import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Finance Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Text(
            'Welcome to \nFinance Management App',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await addDataToFirestore();
              },
              child: Text('Додати у Firestore'),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> addDataToFirestore() async {
  try {
    await FirebaseFirestore.instance.collection('users').add({
      'name': 'Vitalii Kharlan',
      'email': 'vitaliy.kharlan.1977G@gmail.com',
    });
    print('Data added to Firestore');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}
