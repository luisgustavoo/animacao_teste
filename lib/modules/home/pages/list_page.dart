import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<String> list;

  @override
  void initState() {
    super.initState();
    list = List.generate(50, (index) => 'Item $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = list[index];
          return ListTile(
            title: Text(item),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
