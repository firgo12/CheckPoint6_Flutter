import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/providers/task_group_provider.dart';
import 'package:todo_app/providers/task_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fdxygukbptttglsxuapr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkeHlndWticHR0dGdsc3h1YXByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0MzQ2MzgsImV4cCI6MjA0NDAxMDYzOH0.U1FPYQzaUCp7DDkMaq-brtKDLB1tSRMo0Ym8zX0W1WY',
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TaskGroupProvider()..listTaskGroups(),
      ),
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task APP',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
