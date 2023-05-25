import 'package:flutter/material.dart';

class ComptePage extends StatelessWidget {
  const ComptePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
      ),
      body: const Center(
        child: Text('Contenu de la page "Mon compte"'),
      ),
    );
  }
}