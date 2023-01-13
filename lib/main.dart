import 'package:flutter/material.dart';
import 'package:http1/network_service.dart';

import 'model/Post.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    posts=NetworkService().loadData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter HTTP"),
      ),
      body: FutureBuilder(
          future: posts,
          builder: (BuildContext context,AsyncSnapshot<List<Post>> snapshot){
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context,int index){
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  children: [
                    Text(snapshot.data![index].userId.toString()),
                    Text(snapshot.data![index].id.toString()),
                    Text(snapshot.data![index].title.toString()),
                    Text(snapshot.data![index].body.toString()),
                  ],
                ),
              );
            });
      })
    );
  }
}
