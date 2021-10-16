import 'package:flutter/material.dart';
import 'package:flutter_research/model.dart';
import 'package:flutter_research/service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Flutter-Research")),
        ),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Model> data = snapshot.data as List<Model>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(data[index].downloadUrl),
                      title: Text(data[index].author),
                      trailing: Text(data[index].id),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) return Text("${snapshot.error}");
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
