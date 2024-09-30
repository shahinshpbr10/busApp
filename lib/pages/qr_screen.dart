import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Payment'),
      ),
      body: Center(
        child: QrImageView(
          data: "upi://pay?pa=buscompany@upi&pn=BusCompany&mc=1234&tid=transaction12345&tr=busfare&am=50.00&cu=INR",
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
