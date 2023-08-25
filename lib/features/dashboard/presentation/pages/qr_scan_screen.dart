import 'package:flutter/material.dart';
import 'package:qr_scanner_plus/qr_scanner_plus.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/features/authentication/login/presentation/manager/auth_provider.dart';
import '../../../../core/utils/globals/globals.dart';

enum EntryType { checkIn, checkOut }

class QRViewExample extends StatefulWidget {
  final EntryType entryType;
  const QRViewExample({Key? key, required this.entryType}) : super(key: key);

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  void initState() {
    super.initState();
  }

  bool gotQR = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppState appState = sl();
            appState.moveToBackScreen();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        title: const Text('Scan'),
      ),
      body: Center(
          child: QrScannerPlusView(
        _onResult,
        debug: true,
      )),
    );
  }

  _onResult(List<Barcode> barcodes) {
    if (gotQR) {
      return;
    }
    for (final barcode in barcodes) {
      print(barcode.type);
      print(barcode.rawValue);
      print("Above is code qr");
      final value = barcode.rawValue!;
      AuthProvider authProvider = sl();
      gotQR = true;

      if (widget.entryType == EntryType.checkIn) {
        authProvider.checkInCardNoController.text = value;
        authProvider.getQrById(value);
      } else {
        authProvider.checkOutCardNoController.text = value;
      }
      AppState appState = sl();
      appState.moveToBackScreen();
    }
  }
}
