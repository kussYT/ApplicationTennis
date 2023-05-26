import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Player {
  final String place;
  final String playerName;
  final String points;

  Player({
    required this.place,
    required this.playerName,
    required this.points,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      place: json['place'],
      playerName: json['player'],
      points: json['points'],
    );
  }
}

class ClassementPage extends StatefulWidget {
  const ClassementPage({Key? key}) : super(key: key);

  @override
  _ClassementPageState createState() => _ClassementPageState();
}

class _ClassementPageState extends State<ClassementPage> {
  List<Player> _players = [];
  bool _isLoading = false;
  String _errorMessage = '';

  String _event = 'ATP';

  @override
  void initState() {
    super.initState();
    fetchRankings();
  }

  Future<void> fetchRankings() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    const apiKey =
        "eb300dfe3d3f0f3b1fea8a8a9b68382bcc48d0644500e763e948c0c8724c0ed7";
    final apiUrl =
        'https://api.api-tennis.com/tennis/?method=get_standings&event_type=$_event&APIkey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = response.body;

        final jsonData = json.decode(data);

        if (jsonData['success'] == 1) {
          final results = jsonData['result'];

          final players =
              results.map<Player>((item) => Player.fromJson(item)).toList();

          setState(() {
            _players = players;
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = 'Failed to fetch rankings: Invalid response format';
          });
          print('Failed to fetch rankings: Invalid response format');
        }
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to fetch rankings: ${response.statusCode}';
        });
        print('Failed to fetch rankings: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to fetch rankings: $error';
      });
      print('Failed to fetch rankings: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classement $_event'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: _players.length,
                  itemBuilder: (BuildContext context, int index) {
                    final player = _players[index];
                    return InkWell(
                      onTap: () {
                      },
                      child: Card(
                        color: Colors.blue, // Couleur de fond de la carte
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors
                                      .white, // Couleur de fond du conteneur
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                    player.place,
                                    style: const TextStyle(
                                      color: Colors.blue, // Couleur du texte
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                player.playerName,
                                style: const TextStyle(
                                  color: Colors.white, // Couleur du texte
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                player.points,
                                style: const TextStyle(
                                  color: Colors.white, // Couleur du texte
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _event = _event == 'ATP' ? 'WTA' : 'ATP';
          });
          fetchRankings();
        },
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
