import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lugargentefeliz/data/events/event.dart';
import 'package:lugargentefeliz/data/network_helper.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreen createState() => _EventsScreen();
}

class _EventsScreen extends State<EventsScreen> {
  late Future<List<Event>> events;

  @override
  void initState() {
    super.initState();
    events = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder<List<Event>>(
      future: events,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Event>? events = snapshot.data;
          return ListView.builder(
              itemCount: events?.length,
              itemBuilder: (BuildContext context, int index) {
                return eventTile(events?.elementAt(index));
              });
        } else if (snapshot.hasError) {
          return errorView();
        }
        return const CircularProgressIndicator();
      },
    )));
  }

  Future<List<Event>> getEvents() async {
    final response = await doGet(
        'https://620c4457b5736325938a6f4b.mockapi.io/api/events/events');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Event.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Widget errorView() {
    return const Center(
      child: Text("Ocorreu um erro"),
    );
  }

  Widget eventTile(Event? event) {
    return ListTile(
      leading: const Icon(Icons.event),
      title: Text(event?.title ?? ""),
      subtitle: Text(event?.description ?? ""),
    );
  }
}
