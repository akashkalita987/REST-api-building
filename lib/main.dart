import 'package:apiapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? data;

  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  void readLocalJson() async {
    var d = await rootBundle.loadString("assets/json.json");
    data = userFromJson(d);

    setState(() {
      data = userFromJson(d);
    });

    print(data?.name);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Local Json"),
      ),
      body: data == null 
      ? const Center(child: CircularProgressIndicator())
      : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data!.name.toString()),
            Text(data!.age.toString()),
            Text(data!.married.toString()),
            Text(data!.kids.toString()),

            Row(
              children: [
                Text(data!.hobbies![0].toString()),
                Text(data!.hobbies![1].toString()),
              ],
            )
          ],
          
        ),
      ),
    );
  }
}
