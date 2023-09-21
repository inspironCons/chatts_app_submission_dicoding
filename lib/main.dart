import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:submission_flutter_dasar/presentation/screen/home_screen.dart';



void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setSoftInputMode();
  /// lock rotate
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
      runApp(const MyApp());
  });
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