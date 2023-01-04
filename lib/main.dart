import 'package:flutter/material.dart';
import 'package:live_stream_app/pages/editpage.dart';
import 'package:live_stream_app/providers/stream_setting_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StreamSettingProviders()),
      ],
      child: MaterialApp(
        title: 'Live Stream App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const EditPage(),
      ),
    );
  }
}
