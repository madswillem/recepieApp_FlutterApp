import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> fetchRecepies() async {

  Map data;
  List userData;

  final res = await http.get(Uri.http('192.168.178.64:5000', 'api'));

  return res;
}

class ParseRecepies {
  String? sId;
  String? title;
  List<Ingredeants>? ingredeants;
  String? preparation;
  int? selected;
  String? type;
  String? date;
  int? iV;

  ParseRecepies(
      {this.sId,
        this.title,
        this.ingredeants,
        this.preparation,
        this.selected,
        this.type,
        this.date,
        this.iV});

  ParseRecepies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['ingredeants'] != null) {
      ingredeants = <Ingredeants>[];
      json['ingredeants'].forEach((v) {
        ingredeants!.add(new Ingredeants.fromJson(v));
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
    if (this.ingredeants != null) {
      data['ingredeants'] = this.ingredeants!.map((v) => v.toJson()).toList();
    }
    data['preparation'] = this.preparation;
    data['selected'] = this.selected;
    data['type'] = this.type;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Ingredeants {
  int? id;
  String? ingredient;
  String? amount;

  Ingredeants({this.id, this.ingredient, this.amount});

  Ingredeants.fromJson(Map<String, dynamic> json) {
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
