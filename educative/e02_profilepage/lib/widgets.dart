import 'package:flutter/material.dart';

Widget buildCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.call,
          color: Colors.indigo,
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
          color: Colors.indigo,
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
          color: Colors.indigo,
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
          color: Colors.indigo,
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
          color: Colors.indigo,
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
          color: Colors.indigo,
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
      color: Colors.indigo,
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
      color: Colors.indigo,
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
      color: Colors.indigo,
      onPressed: () {},
    ),
  );
}
