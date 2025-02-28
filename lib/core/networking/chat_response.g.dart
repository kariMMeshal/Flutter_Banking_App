// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      created: (json['created'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChatChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'choices': instance.choices,
    };

_$ChatChoiceImpl _$$ChatChoiceImplFromJson(Map<String, dynamic> json) =>
    _$ChatChoiceImpl(
      index: (json['index'] as num).toInt(),
      message: ChatMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatChoiceImplToJson(_$ChatChoiceImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'message': instance.message,
    };

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'options': instance.options,
    };
