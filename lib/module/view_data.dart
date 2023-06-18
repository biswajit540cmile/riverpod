import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/services.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
  }
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
   // final counter = ref.watch(countProvider);
    var apiData = ref.watch(apiProvider);
    ScrollController scroll = ScrollController();
    scroll.addListener(() {
      if(scroll.position.maxScrollExtent == scroll.position.pixels){
         apiData = ref.refresh(apiProvider);
         ref.read(countProvider.notifier).state++;
      }
    });
    return apiData.when(
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
         controller:scroll,
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index < data.length){
            final item = data[index];
            return ListTile(
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(item['id'].toString()),
              ) ,
              title: Text(item['title'].toString()),
              subtitle: Text(item['completed'].toString()),
            );}else if(index == data.length){
              return Center(child: CircularProgressIndicator(),);
            }
            // else if(index == data.length){
            //   return const CircularProgressIndicator();
            // }
            return null;
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
      skipLoadingOnReload: true,
    );
  }
}
