import 'package:cr_flutter_interactivity/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:surf_logger/surf_logger.dart';

final logger = Logger.empty();

void main() {
  logger.e(
    'This is an error message',
    StackTrace.current,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactions'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Button(label: 'Кнопки', child: ButtonsScreen()),
            _Button(label: 'Жесты', child: GesturesScreen()),
            _Button(label: 'Скролл', child: ScrollScreen()),
            _Button(label: 'PageView', child: PageViewScreen()),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String label;
  final Widget child;
  const _Button({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => child));
      },
      child: Text(label),
    );
  }
}
