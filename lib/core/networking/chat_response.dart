import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required String id,
    required String object,
    required int created,
    required List<ChatChoice> choices,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);
}

@freezed
class ChatChoice with _$ChatChoice {
  const factory ChatChoice({
    required int index,
    required ChatMessage message,
  }) = _ChatChoice;

  factory ChatChoice.fromJson(Map<String, dynamic> json) => _$ChatChoiceFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String role,
    required String content,
    @Default([]) List<String> options, 
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
