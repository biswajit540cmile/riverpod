import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


final apiProvider = FutureProvider<List<dynamic>>((ref) async {
  var data = [];
  var page = ref.watch(myProvider);
  final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_page=$page&_limit=10'));

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body) as List<dynamic>;
    if(res.isNotEmpty){
      data.addAll(res);
    }
    return data;
  } else {
    throw Exception('Failed to load data');
  }
});

final myScrollControllerProvider =
ChangeNotifierProvider.autoDispose((ref) => ScrollController());
final myProvider = Provider<int>((ref) => ref.watch(pageProvider));

final pageProvider = StateProvider<int>((ref) => 1);



