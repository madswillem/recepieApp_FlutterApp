import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recepie_app/home.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Search();
}

class Search extends State<SearchWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: HomeWidget(),
    );
  }
}