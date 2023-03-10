import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recepie_app/network.dart';
import 'package:recepie_app/recipe.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;


class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeWidget> {
  final List<String> _addedEntries = globals.addedEntries;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: fetchRecepies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = json.decode(snapshot.data!.body);
            int? statusCode = snapshot.data?.statusCode;
            if (statusCode == 200) {
              return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final id = ParseRecepies.fromJson(data[index]).sId;
                  final title = ParseRecepies.fromJson(data[index]).title;
                  return _buildRow(id, title, index);
                },
                separatorBuilder: (BuildContext context,
                    int index) => const Divider(),
              );
            } else {
              Text('$statusCode');
            }
          }
          return Text('data not loading');
        }
    );
  }

  Widget _buildRow(id, title, entry) {
    final _added = _addedEntries.contains('$title');
    return ListTile(
      title: Text('$title'),
      trailing: Icon(
        _added ? Icons.add_box : Icons.add_box_outlined,
      ),
      onTap: () {
        setState(() {
          _added ? _addedEntries.remove('$title') : _addedEntries.add('$title');
        });
      },
      onLongPress: () =>
      {
        globals.selected = entry,
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecepieWidget()))
            .then((value) {
          setState(() {});
        })
      },
    );
  }


}
