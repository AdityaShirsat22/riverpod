import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/item_provider.dart';

class Homescreen extends ConsumerWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemprovider);
    return Scaffold(
      appBar: AppBar(title: Text("add list")),
      body: items.isEmpty
          ? Text("no data found ")
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final itemdetails = items[index];
                return ListTile(
                  title: Text(itemdetails.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemprovider.notifier)
                              .updateItem(itemdetails.id, "update item");
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemprovider.notifier)
                              .deleteItem(itemdetails.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemprovider.notifier).addItem("new item");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
