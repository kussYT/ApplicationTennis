import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MaterielPage extends StatelessWidget {
  const MaterielPage({Key? key}) : super(key: key);

  Future<List<String>> fetchRaquettes() async {
    final response = await http.get(Uri.parse('https://api.example.com/raquettes'));
    if (response.statusCode == 200) {
      final List<dynamic> raquettesJson = jsonDecode(response.body);
      final List<String> raquettes = raquettesJson.map((json) => json['nom'] as String).toList();
      return raquettes;
    } else {
      throw Exception('Failed to fetch raquettes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matériel'),
      ),
      body: FutureBuilder<List<String>>(
        future: fetchRaquettes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final raquettes = snapshot.data!;
            return ListView.builder(
              itemCount: raquettes.length,
              itemBuilder: (context, index) {
                final raquette = raquettes[index];
                return ListTile(
                  title: Text(raquette),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erreur lors du chargement des raquettes'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}