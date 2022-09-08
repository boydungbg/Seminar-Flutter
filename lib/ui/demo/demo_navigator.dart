import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/utils/routes/routes.dart';

class DemoNavigator extends StatefulWidget {
  const DemoNavigator({Key? key}) : super(key: key);

  @override
  State<DemoNavigator> createState() => _DemoNavigatorState();
}

class _DemoNavigatorState extends State<DemoNavigator> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(title: Text('Demo navigation'), actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.demoInherited);
              },
              icon: Icon(Icons.arrow_right_rounded)),
        ]),
        body: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stateless rebuild when parent rebuild
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.home);
                    },
                    child: const Text(
                      'Push named',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Pop',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      int count = 1;
                      Navigator.of(context).popUntil((route) => count++ == 3);
                    },
                    child: const Text(
                      'Pop Until',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      int count = 1;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.demoContext, (route) => count++ == 3);
                    },
                    child: const Text(
                      'Push and Remove Until',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(Routes.home);
                    },
                    child: const Text(
                      'Push and Remove Until',
                      style: TextStyle(color: Colors.white),
                    ))
              ]),
        ),
      ),
    );
  }
}
