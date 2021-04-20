import 'package:clean_architecture_example/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: LoginPage(),
    );
  }
}
