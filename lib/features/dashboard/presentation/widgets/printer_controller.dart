import 'package:flutter/services.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:intl/intl.dart';
import 'package:sb_myreports/features/dashboard/presentation/widgets/printerenum.dart';

///Test printing
class PrinterController {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  printQrCode(String qrCode, String vehicle) async {
    bluetooth.isConnected.then((isConnected) {
      if (isConnected == true) {
        bluetooth.write('Gulberg Greens ');
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printQRcode(qrCode, 200, 200, Align.right.val);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        //   final imageBytes = byte.;      // byte.buffer.asUint8List()      //   bluetooth.printImageBytes(data.buffer.asUint8List());
        bluetooth.print3Column(
            'Vehicle Number: $vehicle             ',
            'Time:${DateFormat('EEEE yyyy-MM-dd HH:mm').format(DateTime.now())}',
            '..',
            100);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }
}
