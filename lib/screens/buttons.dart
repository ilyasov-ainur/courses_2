import 'dart:developer';

import 'package:flutter/material.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  late final MaterialStatesController controller;
  var _isFly = false;
  var _isLoading = false;

  @override
  void initState() {
    controller = MaterialStatesController()
      ..addListener(() {
        log('State: ${controller.value}');
      });
    super.initState();
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> loadData() async {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _ButtonsBlock(
              title: 'Filled',
              children: [
                FilledButton(
                  onPressed: () => showSnack('Pressed'),
                  onLongPress: () => showSnack('LongPress'),
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  child: const Text('Press me!'),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: () {},
                  statesController: controller,
                  child: const Text('Hold me!'),
                ),
                const SizedBox(width: 16),
                FilledButton.tonal(
                  onPressed: () {},
                  statesController: controller,
                  child: const Text('Hold me!'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //     if (states.contains(MaterialState.disabled)) {
                  //       return Colors.grey;
                  //     }
                  //     return Colors.green;
                  //   }),
                  // ),
                  style: FilledButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                  label: const Text('Show snack'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _ButtonsBlock(
              title: 'Text',
              children: [
                TextButton(
                  onPressed: () {
                    showSnack('Pressed');
                  },
                  onLongPress: () {
                    showSnack('LongPress');
                  },
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  child: const Text('Press me'),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                  ),
                  label: const Text('Cancel'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _ButtonsBlock(
              title: 'Elevated',
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showSnack('Pressed');
                  },
                  onLongPress: () {
                    showSnack('LongPress');
                  },
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  child: const Text('Press me'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: null,
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  icon: const Icon(Icons.touch_app),
                  label: const Text('Press me'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _ButtonsBlock(
              title: 'Outline',
              children: [
                OutlinedButton(
                  onPressed: () {
                    showSnack('Pressed');
                  },
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  child: const Text('Press me'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showSnack('Pressed');
                  },
                  onFocusChange: (value) => showSnack('Focus: $value'),
                  child: const Text('Press me'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _ButtonsBlock(
              title: 'Icons',
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  tooltip: 'Add',
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _ButtonsBlock(
              title: 'Tips',
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    disabledBackgroundColor: Colors.amberAccent,
                  ),
                  onPressed: _isLoading
                      ? null
                      : () async {
                          await loadData();
                        },
                  child: _isLoading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('loading'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: _isFly ? 10 : 0,
                    backgroundColor: _isFly ? Colors.redAccent : Colors.blueAccent,
                    foregroundColor: _isFly ? Colors.black : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFly = !_isFly;
                    });
                  },
                  icon: Icon(_isFly ? Icons.flight_land_rounded : Icons.flight),
                  label: Text(_isFly ? 'Land' : 'Fly'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonsBlock extends StatelessWidget {
  const _ButtonsBlock({
    required this.title,
    required this.children,
  });
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(title),
        const SizedBox(height: 16),
        Wrap(
          children: children,
        )
      ],
    );
  }

  Text _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
