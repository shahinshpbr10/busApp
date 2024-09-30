import 'package:bus_companion/pages/passenger_management_screen.dart';
import 'package:bus_companion/pages/qr_screen.dart';
import 'package:bus_companion/pages/sos_alert_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Companion App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PassengerManagementScreen()),
                );
              },
              child: Text('Passenger Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SosAlertScreen()),
                );
              },
              child: Text('SOS Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRPaymentScreen()),
                );
              },
              child: Text('QR Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
