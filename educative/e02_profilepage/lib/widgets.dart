import 'package:flutter/material.dart';

Widget buildBodyWidget() {
  return ListView(
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
  );
}

Widget buildAppBarWidget() {
  return AppBar(
    //backgroundColor: Colors.white,
    leading: const Icon(
      Icons.arrow_back,
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          print("Contact is starred!");
        },
        icon: const Icon(Icons.star_border),
      ),
    ],
  );
}

Widget buildCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.call,
        ),
      ),
      const Text("Call"),
    ],
  );
}

Widget buildTextButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.message,
        ),
      ),
      const Text("Text"),
    ],
  );
}

Widget buildVideoCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.video_call,
        ),
      ),
      const Text("Video"),
    ],
  );
}

Widget buildEmailButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.email,
        ),
      ),
      const Text("Email")
    ],
  );
}

Widget buildDirectionsButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.directions,
        ),
      ),
      const Text("Directions"),
    ],
  );
}

Widget buildPayButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.payment,
        ),
      ),
      const Text("Pay"),
    ],
  );
}

Widget mobilePhoneListTile() {
  return ListTile(
    leading: const Icon(Icons.call),
    title: const Text("4445-489-909"),
    subtitle: const Text("mobile"),
    trailing: IconButton(
      icon: const Icon(Icons.message),
      onPressed: () {},
    ),
  );
}

Widget otherPhoneListTile() {
  return ListTile(
    leading: const Text(""),
    title: const Text("4445-347-489"),
    subtitle: const Text("mobile"),
    trailing: IconButton(
      icon: const Icon(Icons.message),
      onPressed: () {},
    ),
  );
}

Widget emailListTile() {
  return const ListTile(
    leading: Icon(Icons.email),
    title: Text("amaldonadojuarez@gmail.com"),
    subtitle: Text("work"),
  );
}

Widget addressListTile() {
  return ListTile(
    leading: const Icon(Icons.location_on),
    title: const Text("Fuente de Neptuno 2000, Balcones"),
    subtitle: const Text("home"),
    trailing: IconButton(
      icon: const Icon(Icons.directions),
      onPressed: () {},
    ),
  );
}
