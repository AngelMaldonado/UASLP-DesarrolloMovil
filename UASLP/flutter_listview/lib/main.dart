import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ListView scrolleable con Widgets'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Card(
            // Add space between the cards.
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'images/cybertruck.jpg',
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Cybertruck',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$1,000,000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet,\n'
                      'consectetur adipiscing elit.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              title: Text('Model 3'),
                              content: Text('Lorem ipsum dolor sit amet, \n'
                                  'consectetur adipiscing elit.'),
                            ));
                  },
                  child: Image.asset(
                    'images/model3.jpg',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              title: Text('Model X'),
                              content: Text('Lorem ipsum dolor sit amet, \n'
                                  'consectetur adipiscing elit.'),
                            ));
                  },
                  child: Image.asset(
                    'images/modelx.jpg',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tesla',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  'Fusce porttitor mauris sit amet nisi ultrices tempus.'
                  'Nullam augue enim, euismod in eros a, eleifend mollis'
                  'lacus. Nulla molestie, enim ac rutrum mollis, lacus eros'
                  'elementum lacus, id ultrices justo leo vel est.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset('images/tesla.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
