import 'package:appwrite_playground/providers/user_list/user_list_notifier.dart';
import 'package:appwrite_playground/providers/user_list/user_list_states.dart';
import 'package:appwrite_playground/routes/chat_page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListPage extends ConsumerStatefulWidget {
  static const routeName = '/userList';
  const UserListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  @override
  void initState() {
    super.initState();
    ref.read(getUserListProvider.notifier).getUserList();
  }

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(getUserListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: list.status == UserListDataState.initial
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : list.status == UserListDataState.loaded
              ? ListView.builder(
                  itemBuilder: (ctx, pos) {
                    return ListTile(
                      title: Text(list.users[pos].name),
                      onTap: () {
                        ref
                            .read(getUserListProvider.notifier)
                            .setSelectedPos(pos);
                        Navigator.pushNamed(context, ChatListPage.routeName);
                      },
                    );
                  },
                  itemCount: list.total,
                )
              : const Center(
                  child: Text('Error'),
                ),
    );
  }
}
