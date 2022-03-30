import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatListModel extends Equatable {
  final String message;
  final String channelId;
  final String senderId;
  final String recieverId;
  const ChatListModel({
    required this.message,
    required this.channelId,
    required this.senderId,
    required this.recieverId,
  });

  @override
  List<Object> get props => [message, channelId, senderId, recieverId];

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'channelId': channelId,
      'senderId': senderId,
      'recieverId': recieverId,
    };
  }

  factory ChatListModel.fromMap(Map<String, dynamic> map) {
    return ChatListModel(
      message: map['message'] as String,
      channelId: map['channelId'] as String,
      senderId: map['senderId'] as String,
      recieverId: map['recieverId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListModel.fromJson(String source) =>
      ChatListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatListModel(message: $message, channelId: $channelId, senderId: $senderId, recieverId: $recieverId)';
  }
}
