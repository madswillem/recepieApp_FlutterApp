import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class RecepieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Recepie();
}

class Recepie extends State<RecepieWidget>{
  final List<String> _addedEntries = globals.addedEntries;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globals.selected),
        actions: [
          addButton(globals.selected)
        ],
      ),
    );
  }

  addButton(entry) {
    final _added = _addedEntries.contains(entry);
    return IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: Icon(
            _added ? Icons.add_box : Icons.add_box_outlined,
            size: 32.0
        ),
        onPressed: (){
          setState(() {
            _added ? _addedEntries.remove(entry) : _addedEntries.add(entry);
          });
        }
    );
  }
}