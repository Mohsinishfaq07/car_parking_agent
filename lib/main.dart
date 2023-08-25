import 'package:flutter/material.dart';
import 'dependency_container.dart' as di;
import 'features/dashboard/presentation/widgets/custom_thermal_printer.dart';
import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  CustomThermalPrinter.instance.connect();
  runApp(const MyApp());
  await CustomThermalPrinter.instance.initPlatformState();
}
