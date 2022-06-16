import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TextPad());
}

class TextPad extends StatelessWidget {
  const TextPad({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Pad',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Notebooks(title: 'title'),
    );
  }
}

class Notebooks extends StatefulWidget {
  const Notebooks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Notebooks> createState() => _NotebooksState();
}

class _NotebooksState extends State<Notebooks> {
  String _current = '';
  var _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.keyA) {
                setState(() {
                  _text += '[A_KeyDown]';
                });
                return KeyEventResult.handled;
              } else if (event.logicalKey ==  LogicalKeyboardKey.keyB) {
                setState(() {
                  _text += '[B_KeyDown]';
                });
                return KeyEventResult.handled;
              }
            }
            else if(event is KeyRepeatEvent)
            {
              if (event.logicalKey == LogicalKeyboardKey.keyA) {
                setState(() {
                  _text += '[A_Repeat]';
                });
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
                setState(() {
                  _text += '[B_Repeat]';
                });
                return KeyEventResult.handled;
              }
            }
            else if(event is KeyUpEvent)
            {
              if (event.logicalKey == LogicalKeyboardKey.keyA) {
                setState(() {
                  _text += '[A_KeyUp]';
                });
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
                setState(() {
                  _text += '[B_KeyUp]';
                });
                return KeyEventResult.handled;
              }

            }
            return KeyEventResult.ignored;
          },
          child: Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: _current),
                maxLines: 20,
                style: const TextStyle(color: Colors.black),
                onChanged: (text) {
                  _current = text;
                },
              ),
              Text(_text),
            ],
          )
        ),
      ),
    );
  }
}
