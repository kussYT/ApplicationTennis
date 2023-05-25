import 'package:flutter/material.dart';

class ClassementPage extends StatelessWidget {
  const ClassementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classement ATP'),
      ),
      body: const Center(
        child: Text('Contenu de la page "Classement ATP"'),
      ),
    );
  }
}