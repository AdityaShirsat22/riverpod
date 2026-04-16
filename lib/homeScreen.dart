import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_project/search_provider.dart';

class Homescreen extends ConsumerWidget {
  final countProvider = StateProvider<int>((ref) => 0);

  Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Counter")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchprovider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchprovider);
              return Text(search.search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchprovider);
              return Switch(
                value: search.ischange,
                onChanged: (value) {
                  ref.read(searchprovider.notifier).onchange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
