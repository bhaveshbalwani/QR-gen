import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String _data = 'hello'; // Data for QR code
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: const Size.square(200),
          painter: QrPainter(
            data: _data,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.white,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Colors.white,
            ),
            // size: 320.0,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _generateRandomData,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Button color
          ),
          child: const Text(
            'Generate Random QR Code',
            style: TextStyle(color: Colors.white), // Button text color
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: _textEditingController,
            style: const TextStyle(color: Colors.white), // Text color
            decoration: const InputDecoration(
              labelText: 'Enter Custom Data',
              labelStyle: TextStyle(color: Colors.white), // Label text color
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _generateCustomData,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color
          ),
          child: const Text(
            'Generate Custom QR Code',
            style: TextStyle(color: Colors.white), // Button text color
          ),
        ),
      ],
    );
  }

  void _generateRandomData() {
    setState(() {
      // Generate random data for QR code
      _data = Random().nextInt(100000).toString();
    });
  }

  void _generateCustomData() {
    setState(() {
      // Use custom data for QR code
      _data = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
