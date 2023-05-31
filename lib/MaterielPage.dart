import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MaterielPage extends StatelessWidget {
  final databaseProvider = DatabaseProvider()..open();

  MaterielPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.sports_tennis),
            SizedBox(width: 8.0),
            Text('Le Matériel'),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.greenAccent, Colors.green],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final racket1 = TennisRacket(
                  brand: 'Wilson',
                  weight: 300.0,
                );
                await databaseProvider.insertTennisRacket(racket1);

                final racket2 = TennisRacket(
                  brand: 'Head',
                  weight: 320.0,
                );
                await databaseProvider.insertTennisRacket(racket2);
              },
              child: const Text('Insérer des raquettes'),
            ),
            ElevatedButton(
              onPressed: () {
                _showRaquettesDialog(context);
              },
              child: const Text('Afficher les raquettes'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteAllRaquettes();
              },
              child: const Text('Supprimer toutes les raquettes'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRaquettesDialog(BuildContext context) async {
    final rackets = await databaseProvider.getTennisRackets();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Liste des raquettes'),
          content: SingleChildScrollView(
            child: Column(
              children: rackets.map((racket) {
                return ListTile(
                  title: Text('Raquette: ${racket.brand}'),
                  subtitle: Text('Poids: ${racket.weight}'),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAllRaquettes() async {
    await databaseProvider.deleteAllRaquettes();
    print('Toutes les raquettes ont été supprimées de la base de données.');
  }
}

class TennisRacket {
  final String brand;
  final double weight;

  TennisRacket({required this.brand, required this.weight});
}

class DatabaseProvider {
  late Database _database;

  Future<void> open() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'tennis_rackets.db');

    _database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE tennis_rackets (
            id INTEGER PRIMARY KEY,
            brand TEXT NOT NULL,
            weight REAL NOT NULL
          )
          ''');
    });
  }

  Future<void> insertTennisRacket(TennisRacket racket) async {
    await _database.insert('tennis_rackets', {
      'brand': racket.brand,
      'weight': racket.weight,
    });
  }

  Future<List<TennisRacket>> getTennisRackets() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('tennis_rackets');

    return List.generate(maps.length, (i) {
      return TennisRacket(
        brand: maps[i]['brand'],
        weight: maps[i]['weight'],
      );
    });
  }

  Future<void> deleteAllRaquettes() async {
    await _database.delete('tennis_rackets');
  }
}
