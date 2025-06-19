import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Hello $name"),
      ),
    );
  }
}
