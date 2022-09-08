import 'dart:math';

import 'package:flutter/material.dart';

class Info extends InheritedWidget {
  const Info({
    Key? key,
    required this.score,
    required Widget child,
  }) : super(key: key, child: child);

  final int score;

  static Info? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    return score != oldWidget.score;
  }
}

class CurrentScore extends StatelessWidget {
  const CurrentScore();

  @override
  Widget build(BuildContext context) {
    final Info? info = Info.of(context);

    return Container(
      child: Text(info!.score.toString()),
    );
  }
}

class InheritedWidgetExample extends StatefulWidget {
  @override
  _InheritedWidgetExampleState createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  final Random _random = Random();
  int _score = 10;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: keyForm,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (_) {
                  if (_ == '') {
                    return "Must be requied!";
                  }
                },
              ),
              Info(
                score: _score,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.score),
                    CurrentScore(),
                    Builder(builder: (_) {
                      return OutlinedButton(
                        child: const Text('Change'),
                        onPressed: () {
                          keyForm.currentState?.validate();
                          setState(() {
                            _score = _random.nextInt(100);
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
