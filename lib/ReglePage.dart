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
            if (_selectedType == 'simple') ..._buildSimpleRules(),
            if (_selectedType == 'double') ..._buildDoubleRules(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSimpleRules() {
    return [
      const Text(
        'Règles Simples',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10.0),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Le match se joue en 1 contre 1',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Le match se joue en 2 sets de 6 jeux gagnants.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Un jeu se joue en premier à 4 points et est comptabilisé de la manière suivante : 15, 30, 40, jeu.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'En cas d\'égalité à 40-40, alors le jeu se joue en avantage.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'En cas d\'égalité à 5-5, alors le set se joue en premier à 7 jeux.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'En cas d\'égalité à 6-6, un tie-break est joué pour décider du vainqueur du set.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Le tie-break se joue en premier à 7 points.',
      ),
    ];
  }

  List<Widget> _buildDoubleRules() {
    return [
      const Text(
        'Règles Doubles',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10.0),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Le match se joue en 2 sets de 6 jeux gagnants.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Un jeu se joue en premier à 4 points et est comptabilisé de la manière suivante : 15, 30, 40, jeu.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'En cas d\'égalité à 40-40, alors le retourneur choisit le côté du service et le jeu se joue sur point décisif (optionnel)',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'En cas d\'égalité à 6-6, un tie-break est joué pour décider du vainqueur du set.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Les équipes se composent de deux joueurs sur chaque côté.',
      ),
      _buildRuleCard(
        leadingIcon: Icons.sports_tennis,
        title: 'Les joueurs de chaque équipe se placent de chaque côté du filet.',
      ),
      // Ajoutez ici d'autres règles pour les matchs doubles
    ];
  }

  Widget _buildRuleCard({required IconData leadingIcon, required String title}) {
    return Card(
      child: InkWell(
        onTap: () {
          // Action à effectuer lors du clic sur une règle
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(leadingIcon),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
