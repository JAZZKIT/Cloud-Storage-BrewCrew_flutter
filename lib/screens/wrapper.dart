import 'package:brew_crew/models/theUser.dart';
import 'package:brew_crew/screens/auth/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context); // try to use new provider
    print('Wrapper - $user');
    if (user == null) {
      return Authenticate(); //refactorthis try to use screens with navigator. I tried to do it, but it doesn't make any sense.
    } else {
      return Home();
    }
  }
}
