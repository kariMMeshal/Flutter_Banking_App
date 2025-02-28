// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRequestImpl _$$ChatRequestImplFromJson(Map<String, dynamic> json) =>
    _$ChatRequestImpl(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$$ChatRequestImplToJson(_$ChatRequestImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
    };
