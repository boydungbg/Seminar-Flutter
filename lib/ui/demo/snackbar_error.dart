import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/utils/routes/routes.dart';

class DemoContext extends StatefulWidget {
  const DemoContext({Key? key}) : super(key: key);

  @override
  State<DemoContext> createState() => _DemoContextState();
}

class _DemoContextState extends State<DemoContext> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(title: Text('Demo context'), actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.demoNavigator);
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
                Builder(builder: (_) {
                  return TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(_).showSnackBar(
                            SnackBar(content: Text('Sao khong loi!')));
                      },
                      child: const Text(
                        'Show snackber',
                        style: TextStyle(color: Colors.white),
                      ));
                })
              ]),
        ),
      ),
    );
  }
}
