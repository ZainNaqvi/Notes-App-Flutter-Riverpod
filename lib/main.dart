import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // wrap the MyApp widget to ProviderScope => Just like disposing
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends HookWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Riverpod"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'State Management With Flutter Riverpod',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.pink),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
                enabledBorder: outlineBorder(),
                focusedBorder: outlineBorder(),
                border: outlineBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                hintText: "Description",
                enabledBorder: outlineBorder(),
                focusedBorder: outlineBorder(),
                border: outlineBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                  width: 190,
                  height: 35,
                  child: ElevatedButton(onPressed: () {}, child: Text("Add"))),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Notes:',
            ),
            Text(
              'Total No of notes are :0',
              style: Theme.of(context).textTheme.bodyText1,
            ),

          ],
        ),
      ),
      
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            height: 50,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey),
      gapPadding: 1,
    );
  }
}
