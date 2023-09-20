import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:submission_flutter_dasar/presentation/screen/home_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setSoftInputMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(),
      home: const HomePageScreen(),
    );
  }
}

void setSoftInputMode() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  // Use the SystemChannels class to send a platform message to adjust the pan behavior
  SystemChannels.textInput.invokeMethod('TextInput.setAlwaysUseConfiguration', <String, dynamic>{
    'TextInputConfiguration': 'TextInputConfiguration.alwaysUsePan',
  });
}