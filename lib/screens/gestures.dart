import 'package:flutter/material.dart';

class GesturesScreen extends StatefulWidget {
  const GesturesScreen({super.key});

  @override
  State<GesturesScreen> createState() => _GesturesScreenState();
}

class _GesturesScreenState extends State<GesturesScreen> {
  var _containerColor = Colors.red;
  var _dragCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _onTap,
              onDoubleTap: _onDoubleTap,
              onLongPress: _onLongPress,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _containerColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                LongPressDraggable<int>(
                  data: 1,
                  delay: const Duration(milliseconds: 100),
                  feedback: Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue.withOpacity(0.3),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    color: Colors.blue,
                    child: const Text('Drag me'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DragTarget<int>(
                    builder: (context, candidateItems, rejectedItems) {
                      return Container(
                        width: 200,
                        height: 100,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text("Drag count\n$_dragCount"),
                      );
                    },
                    onAcceptWithDetails: (details) {
                      setState(() {
                        _dragCount += details.data;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      if (_containerColor == Colors.red) {
        _containerColor = Colors.green;
      } else {
        _containerColor = Colors.red;
      }
    });
  }

  void _onDoubleTap() {
    setState(() {
      _containerColor = Colors.blue;
    });
  }

  void _onLongPress() {
    setState(() {
      _containerColor = Colors.amber;
    });
  }
}
