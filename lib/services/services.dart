import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

var data = [];

final apiProvider = FutureProvider<List<dynamic>>((ref) async {
  ref.onDispose(() {
    ref.read(countProvider.notifier).dispose();

  });
  var page = ref.watch(countProvider);
 //  print("^^^^^ $page");
  try{
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_page=$page'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body) as List<dynamic>;
      if(res.isNotEmpty){
        data.addAll(res);
      }else{
      }
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }catch(e){}
  return data;

});

final countProvider = StateProvider<int>((ref) => 1);

