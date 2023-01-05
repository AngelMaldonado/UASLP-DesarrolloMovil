import 'package:flutter/material.dart';
import 'package:e02_profilepage/widgets.dart';

void main() => runApp(ContactProfilePage());

class ContactProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Contact is starred!");
              },
              color: Colors.black,
              icon: const Icon(Icons.star_border),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/45006558?v=4",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Angel Maldonado",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildCallButton(),
                      buildTextButton(),
                      buildVideoCallButton(),
                      buildEmailButton(),
                      buildDirectionsButton(),
                      buildPayButton(),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                mobilePhoneListTile(),
                otherPhoneListTile(),
                const Divider(
                  color: Colors.grey,
                ),
                emailListTile(),
                const Divider(
                  color: Colors.grey,
                ),
                addressListTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
