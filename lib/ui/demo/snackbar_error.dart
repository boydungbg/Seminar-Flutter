import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/ui/demo/demo_navigator.dart';
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
                // Navigator.push(context, PageRouteBuilder(pageBuilder: ((context, animation, secondaryAnimation) => DemoNavigator())))
              },
              icon: Icon(Icons.arrow_right_rounded)),
        ]),
        body: Theme(
          data: ThemeData(
            appBarTheme: AppBarTheme(centerTitle: false)
          ),
          child: Container(
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
                          print(Theme.of(_).appBarTheme.centerTitle);
                          ScaffoldMessenger.of(_).showSnackBar(
                              SnackBar(content: Text('Sao khong loi!')));
                        },
                        child: const Text(
                          'Show snackbar',
                          style: TextStyle(color: Colors.white),
                        ));
                  })
                ]),
          ),
        ),
      ),
    );
  }
}
