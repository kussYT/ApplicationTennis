import 'package:flutter/material.dart';

class ReglePage extends StatelessWidget {
  const ReglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Règle du tennis'),
      ),
      body: const Center(
        child: Text('Contenu de la page "Règle du tennis"'),
      ),
    );
  }
}