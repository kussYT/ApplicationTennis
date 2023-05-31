import 'package:flutter/material.dart';
import 'ReglePage.dart';
import 'ClassementPage.dart';
import 'MaterielPage.dart';
import 'ComptePage.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReglePage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/RG.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.all(0.0),
                        child: Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: Image.asset('assets/images/book.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassementPage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Bleu.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.all(0.0),
                        child: Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: Image.asset('assets/images/ranking.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaterielPage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Herbe.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.all(0.0),
                        child: Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: Image.asset('assets/images/raquet.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComptePage()),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Red.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: const EdgeInsets.all(0.0),
                        child: Center(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: Image.asset('assets/images/utilisateur.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
