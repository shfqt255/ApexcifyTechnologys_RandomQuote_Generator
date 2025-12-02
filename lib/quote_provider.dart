import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class quoteProvider extends ChangeNotifier {
  List _quote = [];
  List _auther = [];

  List getQuote() => _quote;
  List getauther() => _auther;

  Future<void> fetchQuote() async {
    final url = "https://raw.githubusercontent.com/JamesFT/Database-Quotes-JSON/master/quotes.json";


try {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body); 
    final randomIndex = Random().nextInt(data.length);
    final quoteData = data[randomIndex];

    _quote.add(quoteData["quoteText"]);
    _auther.add(quoteData["quoteAuthor"]);
  } else {
    _quote.add('Failed to load!');
    _auther.add('');
  }
} catch (e) {
  Fluttertoast.showToast(msg:"Error Occured: $e");
}

    notifyListeners();
  }
}