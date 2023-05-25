import 'package:flutter/material.dart';
import 'Menu.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/court-terre-battue.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.10,
                right: MediaQuery.of(context).size.width * 0.10,
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Text(
                        'MON APP TENNIS',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          // backgroundColor: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(height: 20),
                      // Text(
                      //   '',
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     color: Colors.white,
                      //     // backgroundColor: Colors.orange,
                      //   ),
                      //   textAlign: TextAlign.center,
                      //   maxLines: 2,
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.85,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Menu()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Commencer',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
