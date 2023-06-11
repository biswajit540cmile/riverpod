import 'package:flutter/material.dart';
import 'package:riverpods/module/view_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod"),centerTitle: true,),
      body: Center(child: MaterialButton( onPressed: ()=> Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  ViewData(),
        ),
      ),child: const Text("Click Me")),),
    );
  }
}
