import 'package:flutter/material.dart';
import 'package:recepie_app/recepie.dart';
import 'globals.dart' as globals;


class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeWidget>{
  final List<String> _entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  final String selected = '';
  final List<String> _addedEntries = globals.addedEntries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: _entries.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(_entries[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildRow(entry) {
    final _added = _addedEntries.contains(entry);
    return ListTile(
      title: Text('Entry ' + entry),
      trailing: Icon(
        _added ? Icons.add_box : Icons.add_box_outlined,
      ),
      onTap: () {
        setState(() {
          _added ? _addedEntries.remove(entry) : _addedEntries.add(entry);
        });
      },
      onLongPress: () => {
        globals.selected = entry,
        Navigator.push(context,MaterialPageRoute(builder: (context) => RecepieWidget())).then((value) { setState(() {});})
      },
    );
  }

}





