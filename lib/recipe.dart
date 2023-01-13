import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'network.dart';

class RecepieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Recepie();
}

class Recepie extends State<RecepieWidget> {
  final List<String> _addedEntries = globals.addedEntries;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: fetchRecepies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int? statusCode = snapshot.data?.statusCode;
            if (statusCode == 200) {
              List data = json.decode(snapshot.data!.body);

              final id = ParseRecepies.fromJson(data[globals.selected]).sId;
              final title =
                  ParseRecepies.fromJson(data[globals.selected]).title;
              final preparation =
                  ParseRecepies.fromJson(data[globals.selected]).preparation;
              List<Ingredients>? ings =
                  ParseRecepies.fromJson(data[globals.selected]).ingredients;

              print('Ings: ' + '${ings?[1].amount}');
              return buildScaffold(title, preparation, ings);
            } else {
              Text('$statusCode');
            }
          }
          return Text('data not loading');
        });
  }

  Widget buildScaffold(title, prep, ings) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [addButton(title)],
      ),
      body: ingredeantList(ings, prep),
    );
  }

  addButton(entry) {
    final _added = _addedEntries.contains(entry);
    return IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: Icon(_added ? Icons.add_box : Icons.add_box_outlined, size: 32.0),
        onPressed: () {
          setState(() {
            _added ? _addedEntries.remove(entry) : _addedEntries.add(entry);
          });
        });
  }

  ingredeantList(ings, prep) {
    List<Ingredients>? _ings = ings;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _ings!.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < _ings.length) {
          return _buildRow(_ings, index);
        } else {
          return buildCard(prep);
        }
      },
    );
  }

  _buildRow(ings, i) {
    List<Ingredients>? _ings = ings;
    return ListTile(
      title:
          Text('${_ings?[i].ingredient}', style: const TextStyle(fontSize: 20)),
      trailing:
          Text('${_ings?[i].amount}', style: const TextStyle(fontSize: 20)),
    );
  }

  buildCard(prep) {
    return ListTile(
      title: Column(
        children: [
          Text('${prep}', style: const TextStyle(fontSize: 20, ))
        ],
      ),
    );
  }
}
