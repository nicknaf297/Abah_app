import 'package:abah_app/config/theme.dart';
import 'package:abah_app/helper/objectbox.dart';
import 'package:abah_app/screens/hdr_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late ObjectBox objectBox;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  runApp(
    ProviderScope(
      child: MyApp()
    )
    
  );
}//Test

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customTheme,
      home: const HdrPage()
    );
  }
}