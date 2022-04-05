import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_project/stores/post/post_store.dart';
import 'package:flutter_boilerplate_project/utils/routes/routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:faker/faker.dart';

class MyModel extends ChangeNotifier {
  int _number = 1;

  UserModel _user = UserModel();

  set number(newValue) {
    _number = newValue;
    notifyListeners();
  }

  set firstName(newValue) {
    _user.firstName = newValue;
    notifyListeners();
  }

  set lastName(newValue) {
    _user.lastName = newValue;
    notifyListeners();
  }

  int get number => _number;
  UserModel get user => _user;
}

class UserModel {
  String firstName = '';
  String lastName = '';
}

class DemoProvider extends StatefulWidget {
  const DemoProvider({Key? key}) : super(key: key);

  @override
  State<DemoProvider> createState() => _DemoProviderState();
}

class _DemoProviderState extends State<DemoProvider> {
  late PostStore postStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postStore = Provider.of<PostStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Provider'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
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
              Observer(
                  builder: ((context) {
                    print('Render number');
                    return Text(postStore.count.toString());
                  })),
              Observer(
                  builder: ((_) => Text(
                      '${postStore.name}'))),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  ),
                  onPressed: () {
                    postStore.updateName();
                  },
                  child: const Text(
                    'Update user',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  ),
                  onPressed: () {
                    postStore.updateCount();
                  },
                  child: const Text(
                    'Update number',
                    style: TextStyle(color: Colors.white),
                  )),
            ]),
      ),
    );
  }
}
