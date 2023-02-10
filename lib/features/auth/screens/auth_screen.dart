import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const MyAuthScreen({super.key});

  @override
  State<MyAuthScreen> createState() => _MyAuthScreenState();
}

class _MyAuthScreenState extends State<MyAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
