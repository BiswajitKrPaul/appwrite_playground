import 'package:appwrite_playground/providers/data_list_states/data_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataList extends ConsumerWidget {
  static const String routeName = '\\datalist';

  const DataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentList = ref.watch(appwriteDataListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.adb))],
      ),
      body: ListView.builder(
        itemCount: documentList.documentList.total,
        itemBuilder: (context, index) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            child: Center(
              child: Text(
                documentList.documentList.documents[index].data['data']
                    as String,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(appwriteDataListProvider.notifier).query(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
