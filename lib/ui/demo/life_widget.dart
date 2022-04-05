import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_boilerplate_project/utils/routes/routes.dart';

class DemoLifeWidget extends StatefulWidget {
  const DemoLifeWidget({Key? key}) : super(key: key);

  @override
  State<DemoLifeWidget> createState() => _DemoLifeWidgetState();
}

class _DemoLifeWidgetState extends State<DemoLifeWidget> {
  bool showWidget = false;
  Color color =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life of widget'),
        actions:[IconButton(onPressed: () {
          Navigator.pushNamed(context, Routes.demoContext);
        }, icon: Icon(Icons.arrow_right_rounded)),
        ]),
      body: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stateless rebuild when parent rebuild
              ContainerColorRandom(color: color),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      color =
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0);
                    });
                  },
                  child: const Text(
                    'Random Color',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  ),
                  onPressed: () {
                    setState(() {
                      showWidget = !showWidget;
                    });
                  },
                  child: const Text(
                    'An Dem So',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 100,
              ),
              if(showWidget == true)
               const CheckState(),
            ]),
      ),
    );
  }
}

class ContainerColorRandom extends StatelessWidget {
  const ContainerColorRandom({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}

class CheckState extends StatefulWidget {
  const CheckState();

  @override
  State<CheckState> createState() => _CheckStateState();
}

class _CheckStateState extends State<CheckState> {
  int countOfWidget = 1000;

  @override
  void initState() {
    print('init state');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('did mount');
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    print(MediaQuery.of(context).size.width);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CheckState oldWidget) {
    print('didUpdate widge');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    print('count off widget ${countOfWidget}');
    return Column(
      children: [
        Text(countOfWidget.toString()),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.cyan),
            ),
            onPressed: () {
              setState(() {
                countOfWidget += 10;
              });
            },
            child: const Text(
              'Tang so len',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
