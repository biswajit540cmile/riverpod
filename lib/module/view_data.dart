import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/services.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("ViewData")),
      body:ViewDataWidget(),
    );
  }
}


class ViewDataWidget extends ConsumerWidget {
   const ViewDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiData = ref.watch(apiProvider);
    final scroll = ref.watch(myScrollControllerProvider);
  // var page = ref.watch(myProvider);
    return apiData.when(
      data: (data) {
        return ListView.builder(
          controller:scroll,
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index < data.length){
             // final item = data[index];
            final item = data[index];
            return ListTile(
              leading:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( ref.watch(pageProvider).toString()),
              ) ,
              title: Text(item['title'].toString()),
              subtitle: Text(item['completed'].toString()),
            );}else{
if(scroll.position.maxScrollExtent == scroll.position.pixels){

}
            }
            return null;
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
