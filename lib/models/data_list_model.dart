import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';

class DataListModel extends Equatable {
  final DocumentList documentList;
  const DataListModel({
    required this.documentList,
  });

  @override
  List<Object?> get props => [documentList];

  DataListModel copyWith({
    DocumentList? documentList,
  }) {
    return DataListModel(
      documentList: documentList ?? this.documentList,
    );
  }
}
