import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/viewmodels/remote_viewmodel.dart';
import 'ui/screens/discovery_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RemoteViewModel(),
      child: const AndroidTvRemoteApp(),
    ),
  );
}

class AndroidTvRemoteApp extends StatelessWidget {
  const AndroidTvRemoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android TV Remote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: const Color(0xFF38BDF8),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8),
          secondary: Color(0xFF818CF8),
        ),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const DiscoveryScreen(),
    );
  }
}
