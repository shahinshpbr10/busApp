import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SosAlertScreen extends StatelessWidget {
  void _sendSosAlert() {
    FirebaseFirestore.instance.collection('sos_alerts').add({
      'timestamp': FieldValue.serverTimestamp(),
      'message': 'SOS! Emergency at bus number XYZ',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Alert'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendSosAlert,
          child: Text('Send SOS Alert'),
        ),
      ),
    );
  }
}
