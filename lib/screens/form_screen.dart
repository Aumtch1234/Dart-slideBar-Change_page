import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(),
    );
  }
}
