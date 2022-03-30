// import 'dart:async';
// import 'dart:developer';

// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart';
// import 'package:appwrite_playground/models/data_list_model.dart';
// import 'package:appwrite_playground/providers/appwrite_providers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DataListNotifier extends StateNotifier<DataListModel> {
//   final Reader read;
//   late final RealtimeSubscription streamSubscription;
//   DataListNotifier(this.read)
//       : super(
//           DataListModel(
//             documentList: DocumentList(total: 0, documents: []),
//           ),
//         ) {
//     getCollectionData();
//     streamSubscription = read(appwriteRealTimeProvider)
//         .subscribe(['collections.623f8c68e330842cf1ce.documents']);
//     streamSubscription.stream.listen((event) {
//       if (event.event == 'database.documents.create') {
//         final DocumentList documentList = DocumentList(
//           total: state.documentList.total + 1,
//           documents: state.documentList.documents
//             ..insert(0, Document.fromMap(event.payload)),
//         );
//         state = state.copyWith(documentList: documentList);
//       }
//     });
//   }
//   Future<void> getCollectionData() async {
//     try {
//       final documentList = await read(appwriteDatabaseProvider).listDocuments(
//         collectionId: '623f8c68e330842cf1ce',
//         orderTypes: ['DESC'],
//       );
//       state = state.copyWith(documentList: documentList);
//     } on AppwriteException catch (e) {
//       log(e.message.toString());
//     }
//   }

//   Future<void> addItem(String data) async {
//     await read(appwriteDatabaseProvider).createDocument(
//       collectionId: '623f8c68e330842cf1ce',
//       documentId: 'unique()',
//       data: {'data': data},
//     );
//   }

//   Future<void> query() async {
//     final listDoc = await read(appwriteDatabaseProvider).listDocuments(
//       collectionId: '623f8c68e330842cf1ce',
//       queries: [Query.equal('data', '22')],
//     );
//     log(listDoc.toMap().toString());
//   }

//   @override
//   void dispose() {
//     streamSubscription.close();
//     super.dispose();
//   }
// }

// final appwriteDataListProvider =
//     StateNotifierProvider<DataListNotifier, DataListModel>((ref) {
//   return DataListNotifier(ref.read);
// });
