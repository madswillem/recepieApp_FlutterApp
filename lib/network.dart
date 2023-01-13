import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> fetchRecepies() async {
  final res = await http.get(Uri.http('192.168.178.64:5000', 'api'));
  return res;
}

class ParseRecepies {
  String? sId;
  String? title;
  List<Ingredients>? ingredients;
  String? preparation;
  int? selected;
  String? type;
  String? date;
  int? iV;

  ParseRecepies(
      {this.sId,
        this.title,
        this.ingredients,
        this.preparation,
        this.selected,
        this.type,
        this.date,
        this.iV});

  ParseRecepies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    preparation = json['preparation'];
    selected = json['selected'];
    type = json['type'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['preparation'] = this.preparation;
    data['selected'] = this.selected;
    data['type'] = this.type;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Ingredients {
  int? id;
  String? ingredient;
  String? amount;

  Ingredients({this.id, this.ingredient, this.amount});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ingredient = json['ingredient'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ingredient'] = this.ingredient;
    data['amount'] = this.amount;
    return data;
  }
}
