import 'package:flutter/material.dart';

class ReglePage extends StatefulWidget {
  const ReglePage({Key? key}) : super(key: key);

  @override
  _ReglePageState createState() => _ReglePageState();
}

class _ReglePageState extends State<ReglePage> {
  String _selectedType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Règles du Tennis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Règles du Tennis',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Sélectionnez le type de règles que vous souhaitez consulter :',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            ListTile(
              title: const Text('Règles Simples'),
              leading: Radio<String>(
                value: 'simple',
                groupValue: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Règles Doubles'),
              leading: Radio<String>(
                value: 'double',
                groupValue: _selectedType,
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0),
            if (_selectedType == 'simple')
              _buildSimpleRules(),
            if (_selectedType == 'double')
              _buildDoubleRules(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleRules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Règles Simples',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('Le match se joue en 2 sets gagnants.'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('Chaque set se joue en premier à 6 jeux.'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('En cas d\'égalité à 6-6, un tie-break est joué pour décider du vainqueur du set.'),
        ),
        // Ajoutez ici d'autres règles pour les matchs simples
      ],
    );
  }

  Widget _buildDoubleRules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
      Text(
      'Règles Doubles',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 10.0),
    ListTile(
    leading: Icon(Icons.sports_tennis),
    title: Text('Le match se joue en 2 sets gagnants.'),
    ),
    ListTile(
    leading: Icon(Icons.sports_tennis),
    title: Text('Chaque set se joue en premier à 6 jeux'),
    ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('En cas d\'égalité à 6-6, un tie-break est joué pour décider du vainqueur du set.'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('Les équipes se composent de deux joueurs sur chaque côté.'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('Les joueurs de chaque équipe se placent de chaque côté du filet.'),
        ),
        // Ajoutez ici d'autres règles pour les matchs doubles
      ],
    );
  }
}