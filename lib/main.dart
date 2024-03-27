import 'package:cr_flutter_interactivity/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
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
            _Button(label: 'Кнопки', page: ButtonsScreen()),
            _Button(label: 'Жесты', page: GesturesScreen()),
            _Button(label: 'Скролл', page: ScrollScreen()),
            _Button(label: 'PageView', page: PageViewScreen()),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String label;
  final Widget page;
  const _Button({
    required this.label,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      child: Text(label),
    );
  }
}
